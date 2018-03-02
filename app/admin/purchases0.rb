# ActiveAdmin.register Purchase,namespace: :customers  do
#   actions :index, :destroy, :show
#   scope_to :current_user
#   controller do
#     def resource
#        Purchase.new.detail_for_buyer(current_user.id,params[:id])
#     end
#   end
#
#
#   show do
#     attributes_table do
#       row :amount , :sortable => :amount do |cur|
#           number_to_currency cur.amount
#       end
#       row :product_name
#       row :price , :sortable => :price do |cur|
#           number_to_currency cur.price
#       end
#       row :card
#       row :created_at
#       row :updated_at
#     end
#   end
#   index do
#     id_column
#     column :amount, sortable: :amount do |cur|
#       number_to_currency cur.amount
#     end
#     column :card
#     column :created_at
#     column :updated_at
#     actions
#   end
# end
# ActiveAdmin.register Purchase,namespace: :admin  do
#   index do
#     id_column
#     column :amount , :sortable => :amount do |cur|
#             number_to_currency cur.amount
#     end
#     column :card
#     column :created_at
#     column :updated_at
#     actions
#   end
# end
