class RhythmController
  attr_accessor :cadastre

  def initialize
    @cadastre = RhythmsCadastre.new
  end

  def saveNewRhythm(rhythm)
    @cadastre.save(rhythm)
  end
end
