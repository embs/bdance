require 'singleton'

class Repositories
  include Singleton

  attr_accessor :users_repository, :rhythms_repository
end
