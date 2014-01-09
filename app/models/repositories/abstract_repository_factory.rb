module AbstractRepositoryFactory
  def self.create
    raise NotImplementedError, "You should implement this method"
  end
end
