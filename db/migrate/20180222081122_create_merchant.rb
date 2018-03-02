class CreateMerchant < ActiveRecord::Migration[5.1]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :image_url
      t.string :address
    end
  end
end
