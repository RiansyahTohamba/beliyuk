class RemoveEmailFromOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :email
  end
end
