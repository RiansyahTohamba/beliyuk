class Merchant < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  has_one :user
  has_many :products

  def get_name(user_id)
    User.find(user_id).merchant.name
  end

  def get_id(user_id)
    User.find(user_id).merchant.id
  end

  def our_product(merchant_id)
    Merchant.find(merchant_id).products.order(:created_at)
  end
end
