class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_one :purchase
  validates :name, :address,  presence: true
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  def total_price
    line_items.to_a.sum(&:total_price)
  end
  def recent(user_id)
    User.find(user_id).line_items.joins(:order)
        .select("order_id as id,orders.name as buyer, orders.address,orders.created_at")
        .where("orders.status = 1").group("order_id")
  end
end
