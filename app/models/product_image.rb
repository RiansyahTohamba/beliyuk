class ProductImage < ApplicationRecord
  belongs_to :product
  mount_uploader :image_url, ImageUploader

end
