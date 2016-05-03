class PictureUploader < CarrierWave::Uploader::Base
  include ImageUploadable
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end
  process resize_to_limit: [300, 300]
end
