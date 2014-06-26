# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  version :thumb do
    process :resize_to_fit => [50, 50]
  end

end
