module ImageUploadable
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Whitelist of extensions which are allowed to be uploaded as picture
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end