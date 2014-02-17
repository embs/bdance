class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    @user.roles.each { |role| send(role.name.downcase) }

    # Usuário não autenticado
    can :read, [Group, Modality, Rhythm, Event]
  end

  def user
    can :manage, User, id: @user.id
    can :read, Presence, user: @user
  end

  def pupil
    can :read, Pupil
  end

  def teacher
    can :read, Presence, user: @user.user
    can :manage, Presence do |p| p.user.has_role? :pupil end
  end

  def manager
    can :manage, :all
  end
end
