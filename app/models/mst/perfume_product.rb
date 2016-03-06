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
      name = res["textAnnotations"].map{|ann| ann["description"].split("\n")[0] }.join("")
      mst_product = Mst::PerfumeProduct.where("name like '%" + name + "%'").first_or_initialize
      mst_product.name = name
      mst_product.image_url = ""
      mst_product.save!
      mst_product
    end
  end
end
