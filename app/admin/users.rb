ActiveAdmin.register User,namespace: :admin do
  # permit params menjadi penyebab kenapa 1 record ga bisa disave
  permit_params :name, :email, :merchant_id, :password,:password_confirmation
  index do
    id_column
    column :email
    column :name
    column :merchant
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "User" do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
      f.input :merchant_id, :as => :select,
          :collection => Merchant.all.collect {|merchant| [merchant.name, merchant.id] }
    end
    f.actions
  end

end
