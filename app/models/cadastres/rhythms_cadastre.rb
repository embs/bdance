class RhythmsCadastre
  attr_accessor :rhythms_repository

  def initialize
    @rhythms_repository = Repositories.instance.rhythms_repository
  end

  def save(rhythm)
    @rhythms_repository.save(rhythm)
  end
end
