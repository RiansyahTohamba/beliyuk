ActiveAdmin.register Product,namespace: :customers do
  permit_params :title, :price, :description, :image_url, :merchant_id
  scope_to :current_user

  index do
    id_column
    column "Image" do |product|
      image_tag(product.image_url.url(:thumb))
    end
    column :title
    column :price , :sortable => :price do |cur|
            number_to_currency cur.price
    end
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Product" do
      f.input :title
      f.input :price
      f.input :image_url, :as => :file
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
