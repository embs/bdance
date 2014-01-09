class FacebookLoginController
  attr_accessor :cadastre

  def initialize
    @cadastre = UsersCadastre.new
  end

  def find_for_facebook_oauth(auth_hash, current_user)
    @cadastre.find_for_facebook_oauth(auth_hash, current_user)
  end
end
