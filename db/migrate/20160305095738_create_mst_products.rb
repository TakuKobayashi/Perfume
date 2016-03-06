class CreateMstProducts < ActiveRecord::Migration
  def change
    create_table :mst_products do |t|
      t.string :type, null: false
      t.string :name, null: false
      t.string :image_url, null: false
      t.float :review
      t.text :description
      t.integer :price, null: false, default: 0
      t.float :review_average
      t.datetime :register_at, null: false
      t.datetime :review_update_at
    end
  end
end
