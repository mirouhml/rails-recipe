class Ability
  include CanCan::Ability

  def initialize(user)
    cannot :read, :all
    return unless user.present?

    can :read, :all, user_id: user.id
    can :create, Inventory, user_id: user.id
    can :destroy, Inventory, user_id: user.id
  end
end
