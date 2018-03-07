module ProductHelper
  def params_product
    [:title, :price, :description, :merchant_id,
     product_images_attributes: %i[id image_url product_id]]
  end

  def show_product
    proc do
      attributes_table do
        row :title
        row :price do |cur|
          number_to_currency cur.price
        end
        row :created_at
        row :updated_at
      end
      panel 'Images' do
        table_for product.product_images do
          column :image do |image|
            image_tag(image.image_url)
          end
        end
      end
    end
  end

  def form_product
    lambda do |f|
      f.inputs 'Product' do
        f.input :title
        f.input :price
        f.has_many :product_images do |p|
          p.input :image_url, as: :file
        end
        f.input :description
        f.input :merchant_id, input_html: { value: Merchant.new.get_id(current_user.id) }, as: :hidden
      end
      f.actions
    end
  end
end
