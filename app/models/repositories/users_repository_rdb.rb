class UsersRepositoryRDB
  include Repository

  def save(entity)
    entity.save
  end

  def delete(entity)
    entity.destroy
  end

  def find(id)
    User.find(id)
  end

  def find_for_facebook_oauth(auth_hash, current_user)
    User.find_for_facebook_oauth(auth_hash, current_user)
  end
end
