require 'helper/product_helper'
include ProductHelper
ActiveAdmin.register Product,namespace: :customers do
  permit_params params_product

  scope_to :current_user

  index do
    id_column
    column "Image" do |product|
      image_tag(product.product_images.first.image_url.url(:thumb))
    end
    column :title
    column :price , :sortable => :price do |cur|
        number_to_currency cur.price
    end
    actions
  end

  show({},&show_product)

  form(html: { multipart:  true },&form_product)
end

ActiveAdmin.register Product,namespace: :admin do
  permit_params params_product
  show({},&show_product)

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
