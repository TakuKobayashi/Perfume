# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :string(255)
#  path       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_photos_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :photo do
    
  end
end
