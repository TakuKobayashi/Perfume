class InformationController < BaseController
  def index
    @product = PerfumeProduct.find_by(id: params[:product_ids].split(","))
    twClient = Twitter::REST::Client.new do |config|
      config.consumer_key = Constants::Twitter_API_CONSUMER_KEY
      config.consumer_secret = Constants::Twitter_API_CONSUMER_SECRET_KEY
      config.access_token = Constants::Twitter_ACCESS_TOKEN
      config.access_token_secret = Constants::Twitter_ACCESS_TOKEN_SECRET
    end
    @tweets = twClient.search(@product.mst.name, :count => 3, :result_type => "recent")
  end
end
