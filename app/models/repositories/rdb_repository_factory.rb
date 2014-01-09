class RDBRepositoryFactory
  include AbstractRepositoryFactory

  def self.create
    Repositories.instance.users_repository = UsersRepositoryRDB.new
    Repositories.instance.rhythms_repository = RhythmsRepositoryRDB.new
  end
end
