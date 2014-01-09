class UsersCadastre
  attr_accessor :users_repository

  def initialize
    @users_repository = UsersRepositoryRDB.new
  end

  def find_for_facebook_oauth(auth_hash, current_user)
    @users_repository.find_for_facebook_oauth(auth_hash, current_user)
  end
end
