# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  photo_id       :integer          not null
#  mst_product_id :integer          not null
#  type           :string(255)      not null
#  show_at        :datetime         not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_products_on_photo_id_and_mst_product_id  (photo_id,mst_product_id)
#  index_products_on_user_id_and_type             (user_id,type)
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
