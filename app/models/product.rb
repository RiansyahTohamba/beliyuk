class Product < ApplicationRecord
  paginates_per 10
  has_many :line_items
  has_many :product_images
  accepts_nested_attributes_for :product_images
  has_many :orders, through: :line_items
  belongs_to :merchant
  before_destroy :ensure_not_referenced_by_any_line_item
  def my_product?(product_id,user_id)
    User.find(user_id).merchant.products.find(product_id).blank?
    rescue ActiveRecord::RecordNotFound
      true
  end
  private
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end

end
