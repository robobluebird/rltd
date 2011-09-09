require 'carrierwave/processing/mini_magick'

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :mid do
    process :resize_to_fit => [800,800]
  end

  version :thumb do
    process :resize_to_fit => [200,200]
  end

  version :tiny do
    process :resize_to_fit => [100,100]
  end
end
