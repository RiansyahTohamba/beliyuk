ActiveAdmin.register Purchase,namespace: :customers  do
  actions :index, :destroy, :show
  scope_to :current_user
  controller do
    def resource
       @purchase = Purchase.find(params[:id])
       @order = Purchase.find(params[:id]).order
    end
  end


  show do
    attributes_table_for purchase do
      row :amount , :sortable => :amount do |cur|
          number_to_currency cur.amount
      end
      row :card
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
  index do
    id_column
    column :amount, sortable: :amount do |cur|
      number_to_currency cur.amount
    end
    column :card
    column :created_at
    column :updated_at
    actions
  end
end
ActiveAdmin.register Purchase,namespace: :admin  do
  index do
    id_column
    column :amount , :sortable => :amount do |cur|
            number_to_currency cur.amount
    end
    column :card
    column :created_at
    column :updated_at
    actions
  end
end
