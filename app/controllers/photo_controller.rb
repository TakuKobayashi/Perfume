class PhotoController < BaseController
  def confirm
  end

  def upload
    upload_file = params[:upload]
    name = upload_file.original_filename.underscore
    path = Photo.generate_file_path(name)
    file = File.open(path, 'wb') { |f| f.write(upload_file.read)}
    photo = Photo.new(user_id: @user_idname: name, path: path)
    analized = photo.analize!
    redirect_to information_url
  end
end
