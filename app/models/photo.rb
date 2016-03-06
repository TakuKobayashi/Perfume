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

class Photo < ActiveRecord::Base
  belongs_to :user

  PHOTO_FILE_ROOT_PATH = "/tmp/image/"

  def self.generate_file_path(file_name)
    extname = File.extname(file_name)
    return Rails.root.to_s + PHOTO_FILE_ROOT_PATH + SecureRandom.hex(30) + extname
  end

  def analize!
    http_client = HTTPClient.new
    image = Base64.encode64(File.open(path) { |io| io.read })
    request_json = {
      requests: [{
        image: {
          content: image
        },
        features: [{
          type: "LABEL_DETECTION",
          maxResults: 10
        },
        {
          type: "LANDMARK_DETECTION",
          maxResults: 10
        },
        {
          type: "TEXT_DETECTION",
          maxResults: 10
        }]
      }]
    }.to_json
    response = http_client.post_content("https://vision.googleapis.com/v1/images:annotate?key=" + Constants::Google_API_KEY, request_json, 'Content-Type' => 'application/json')
    update!(analized: response)
    return JSON.parse(response)
  end
end
