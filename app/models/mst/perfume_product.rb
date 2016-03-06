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

class Mst::PerfumeProduct < Mst::Product
  def self.generates(analized)
    return nil if analized["responses"].blank?
    analized["responses"].map do |res|
      name = res["textAnnotations"].map{|ann| ann["description"].gsub(" ", "").match(/[a-z|A-Z|0-9]+/).to_a[0]}[0]
      mst_product = Mst::PerfumeProduct.where("name like '%" + name.to_s + "%'").first_or_initialize
      mst_product.name = name

      url = "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20140222?format=json&keyword=" + name + "&applicationId=" + Constants::Rakuten_API_KEY + "&genreId=111120"

      http_client = HTTPClient.new
      response = http_client.get(url)
      result = JSON.parse(response.body)

      if result["Items"].present?
        item = result["Items"].detect{|i| i["Item"]["mediumImageUrls"].present? }
        mst_product.image_url = item["Item"]["mediumImageUrls"].first["imageUrl"]
        mst_product.description = item["Item"]["itemCaption"].to_s
        mst_product.price = item["Item"]["itemPrice"]
        mst_product.review_average = item["Item"]["reviewAverage"]
      end
      mst_product.save!
      mst_product
    end
  end
end
