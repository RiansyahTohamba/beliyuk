ActiveAdmin.register Merchant,namespace: :customers do
  permit_params :name, :image_url, :address, :description
  config.filters = false
  actions :edit, :index

  controller do
    def scoped_collection
      User.new.as_merchant(current_user.id)
    end
    def update
      merchant_params = params.require(:merchant).permit(:name,:image_url, :address, :description)
      if Merchant.update(merchant_params)
        redirect_to customers_merchants_path, notice: "successfully!"
      else
        render active_admin_template('edit.html.erb')
      end
    end
  end

  index do
    column :name
    column :image_url
    column :address
    actions
  end
  form(:html => { :multipart => true }) do |f|
    f.input :name
    f.input :image_url, :as => :file
    f.input :address
    f.input :description
    f.actions
  end
end

ActiveAdmin.register Merchant,namespace: :admin do
  permit_params :name, :image_url, :address,:description
  index do
    column :name
    column :image_url
    column :address
    actions
  end
  form(:html => { :multipart => true }) do |f|
    f.input :name
    f.input :image_url, :as => :file
    f.input :address
    f.input :description
    f.actions
  end
end
