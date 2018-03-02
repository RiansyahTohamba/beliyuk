ActiveAdmin.register Order,namespace: :customers do
  permit_params :name, :address, :status
  actions :index, :edit, :destroy, :show
  controller do
    def scoped_collection
       Order.new.recent(current_user.id)
    end
    def resource
       @order = Order.find(params[:id])
    end
  end
  index do
      id_column
      column :buyer
      column :address
      column :created_at
      actions
  end
  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end
    panel "Line Items" do
      table_for order.line_items do
        column :product do |line|
          line.product.title
        end
        column :price , :sortable => :price do |line|
          number_to_currency line.product.price
        end
        column :quantity
      end
    end
  end
end

ActiveAdmin.register Order,namespace: :admin do
  permit_params :name, :address, :status
  index do
    id_column
    column "Buyer" do |order|
      order.name
    end
    column :address
    column "Product" do |order|
      attributes_table_for order.line_items do
        row :product_id
      end
    end
    column :status
    actions
  end
end
