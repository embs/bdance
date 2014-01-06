class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]
  acts_as_superclass
  has_and_belongs_to_many :events
  has_many :presences
  has_one :address
  has_many :authentications, dependent: :destroy

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
end
