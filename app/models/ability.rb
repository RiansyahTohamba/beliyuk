class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :destroy, Product do |product|
        product.merchant.user == user
      end
    end
  end
end
