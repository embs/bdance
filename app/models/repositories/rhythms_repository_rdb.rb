class RhythmsRepositoryRDB
  include Repository

  def save(entity)
    entity.save
  end

  def delete(entity)
    entity.destroy
  end

  def find(id)
    Rhythm.find(id)
  end
end
