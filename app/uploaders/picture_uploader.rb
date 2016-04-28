class PictureUploader < CarrierWave::Uploader::Base
  include ImageUploadable
  storage :file
  process resize_to_limit: [300, 300]
end
