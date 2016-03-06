class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id, null: false
      t.string :name
      t.string :path, null: false
      t.text :analized
      t.timestamps null: false
    end
    add_index :photos, :user_id
  end
end
