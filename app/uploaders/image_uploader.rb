# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end




  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # # Create different versions of your uploaded files:
  # version :thumb do
  process :resize_to_fit => [800, 800]
  # end

  process :add_text
  def add_text
    p "*" * 90
    
    p "*" * 90
    manipulate! do |img|
      img.combine_options do |c|
        c.font "#{::Rails.root}/public/fonts/Impact.ttf" 
        c.pointsize 20
        c.gravity "North"
        c.draw "text 0,100 '#{model.caption}'"
      end 
    end
  end



  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  # process :add_text
  # def add_text
  #   manipulate! do |image|
  #     image.combine_options do |c|
  #       image.gravity 'Center'
  #       image.pointsize '22'
  #       image.draw "text 0,0 'test'"
  #       image.fill 'white'
  #     end
  #     image
  #   end  
  # end

end
