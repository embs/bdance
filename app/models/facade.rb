require 'singleton'

class Facade
  include Singleton

  attr_accessor :rhythm_controller, :facebook_login_controller

  def initialize
    @rhythm_controller = RhythmController.new
    @facebookLoginController = FacebookLoginController.new
  end

  def saveRhythm(rhythm)
    @rhythm_controller.saveNewRhythm(rhythm)
  end

  def find_for_facebook_oauth(auth_hash, current_user)
    @facebookLoginController.find_for_facebook_oauth(auth_hash, current_user)
  end

end
