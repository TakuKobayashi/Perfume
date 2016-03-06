class PhotoController < BaseController
  def confirm
  end

  def upload
    upload_file = params[:upload]
    name = upload_file.original_filename.underscore
    path = Photo.generate_file_path(name)
    file = File.open(path, 'wb') { |f| f.write(upload_file.read)}
    photo = Photo.new(user_id: @user.id, name: name, path: path)
    analized = photo.analize!
    mst_products = Mst::PerfumeProduct.generates(analized)
    products = mst_products.map do |mst|
      product = PerfumeProduct.find_or_initialize_by(user_id: @user.id, photo_id: photo.id, mst_product_id: mst.id)
      product.update!(show_at: Time.current)
      product
    end
    redirect_to information_url(product_ids: products.map(&:id).join(","))
  end
end
