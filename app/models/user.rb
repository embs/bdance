class User < ActiveRecord::Base
  acts_as_superclass
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]

  has_many :assignments
  has_many :roles, through: :assignments
  has_many :attendances
  has_many :events, through: :attendances
  has_many :presences
  has_one :address
  has_many :authentications, dependent: :destroy
  has_many :phone_numbers, dependent: :destroy

  accepts_nested_attributes_for :phone_numbers, reject_if: lambda { |h| h[:number].blank? },
    allow_destroy: true
  accepts_nested_attributes_for :address

  scope :with_presences, -> { joins(:presences).group("users.id") }

  validates_presence_of :first_name, :last_name, :birth

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    authentication = Authentication.where(:provider => auth.provider, :uid => auth.uid).first
    if authentication
      user = authentication.user
    else
      user = User.create(first_name: auth.info.first_name,
                           last_name: auth.info.last_name,
                           email: auth.info.email,
                           password: Devise.friendly_token[0,20])
      authentication = Authentication.create(provider: auth.provider, uid: auth.uid)
      user.authentications << authentication
    end

    user
  end

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  def name
    "#{first_name} #{last_name}"
  end
end
