json.extract! merchant, :id, :name, :image_url, :description, :products_id, :created_at, :updated_at
json.url merchant_url(merchant, format: :json)
