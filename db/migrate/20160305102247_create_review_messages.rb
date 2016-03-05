class CreateReviewMessages < ActiveRecord::Migration
  def change
    create_table :review_messages do |t|
      t.integer :mst_product_id, null: false
      t.string  :tweet_id
      t.string  :twitter_user_id
      t.text    :message
      t.timestamps null: false
    end
    add_index :review_messages, :mst_product_id
    add_index :review_messages, :tweet_id
    add_index :review_messages, :twitter_user_id
    add_index :review_messages, :created_at
  end
end
