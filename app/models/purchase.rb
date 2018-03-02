class Purchase < ApplicationRecord
  belongs_to :order
  belongs_to :user
  def detail_for_buyer(user_id,purchase_id)
    User.find(user_id).purchases.joins(order: {line_items: :product})
      .select("orders.id, purchases.amount,
        GROUP_CONCAT(products.title ) as product_name,
        GROUP_CONCAT( '( '|| products.price || '*' || line_items.quantity || ' )' ) as price,
        purchases.card,
        orders.created_at,
        orders.updated_at
      ")
      .where("purchases.id = #{purchase_id}")
  end
end
