require 'singleton'

class Facade
  include Singleton

  attr_accessor :rhythm_controller

  def initialize
    @rhythm_controller = RhythmController.new
  end

  def saveRhythm(rhythm)
    @rhythm_controller.saveNewRhythm(rhythm)
  end

end
