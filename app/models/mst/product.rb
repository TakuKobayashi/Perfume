# == Schema Information
#
# Table name: mst_products
#
#  id               :integer          not null, primary key
#  type             :string(255)      not null
#  name             :string(255)      not null
#  image_url        :string(255)      not null
#  review           :float(24)
#  description      :text(65535)
#  register_at      :datetime         not null
#  review_update_at :datetime
#

class Mst::Product < ActiveRecord::Base
end
