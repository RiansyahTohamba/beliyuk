class AddDescriptionToMerchant < ActiveRecord::Migration[5.1]
  def change
    add_column :merchants, :description, :text
  end
end
