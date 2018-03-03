ActiveAdmin.register Product,namespace: :customers do
  permit_params :title, :price, :description ,:merchant_id,
      product_images_attributes: [:id, :image_url, :product_id]

  scope_to :current_user

  index do
    id_column
    column "Image" do |product|
      # TODO: image_tag untuk multiple image gimana ?
      # image_tag(product.product_images.first(:thumb))
    end
    column :title
    column :price , :sortable => :price do |cur|
            number_to_currency cur.price
    end
    actions
  end

  form(html: { multipart:  true }) do |f|
    f.inputs "Product" do
      f.input :title
      f.input :price
      f.has_many :product_images do |p|
          p.input :image_url, as: :file
      end
      f.input :description
      f.input :merchant_id, :input_html => {value: Merchant.new.get_id(current_user.id)} , as: :hidden
    end
    f.actions
  end
end

ActiveAdmin.register Product,namespace: :admin do
  permit_params :title, :price, :description, :image_url, :merchant_id
  form(:html => { :multipart => true }) do |f|
    f.inputs "Product" do
      f.input :title
      f.input :price
      f.input :merchant_id, :as => :select,
          :collection => Merchant.all.collect {|merchant| [merchant.name, merchant.id] }
      f.input :image_url, :as => :file
      f.input :description
    end
    f.actions
  end
end
