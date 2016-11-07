class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :version
      t.string :product_id
      t.string :description
      t.string :image_url
      t.float :price
    end
  end
end
