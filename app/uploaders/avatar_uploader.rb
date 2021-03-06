class AvatarUploader < CarrierWave::Uploader::Base
  include ImageUploadable

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end
  
  process resize_to_limit: [500, 500]

  version :thumb do
    process resize_to_fill: [200,200]
  end

  def default_url(*args)
    "medium/default-no-picture.jpg"
  end
  
end
