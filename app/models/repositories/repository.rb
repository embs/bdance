module Repository
  def save(entity)
    raise NotImplementedError, "You should implement this method"
  end

  def delete(entity)
    raise NotImplementedError, "You should implement this method"
  end

  def find(id)
    raise NotImplementedError, "You should implement this method"
  end
end
