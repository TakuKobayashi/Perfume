class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :user_id, null: false
      t.integer :photo_id, null: false
      t.integer :mst_product_id, null: false
      t.string :type, null: false
      t.datetime :show_at, null: false
      t.timestamps null: false
    end
    add_index :products, [:user_id, :type]
    add_index :products, [:photo_id, :mst_product_id]
  end
end
