# == Schema Information
#
# Table name: review_messages
#
#  id              :integer          not null, primary key
#  mst_product_id  :integer          not null
#  tweet_id        :string(255)
#  twitter_user_id :string(255)
#  message         :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_review_messages_on_created_at       (created_at)
#  index_review_messages_on_mst_product_id   (mst_product_id)
#  index_review_messages_on_tweet_id         (tweet_id)
#  index_review_messages_on_twitter_user_id  (twitter_user_id)
#

class ReviewMessage < ActiveRecord::Base
end
