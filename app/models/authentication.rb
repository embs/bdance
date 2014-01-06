class Authentication < ActiveRecord::Base
  #FIXME strong_params attr_accessible :provider, :token, :uid, :user_id

  belongs_to :user
  validates_presence_of :provider, :uid
end
