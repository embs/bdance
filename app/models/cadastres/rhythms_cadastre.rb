class RhythmsCadastre
  attr_accessor :rhythms_repository

  def initialize
    @rhythms_repository = RhythmsRepositoryRDB.new
  end

  def save(rhythm)
    @rhythms_repository.save(rhythm)
  end
end
