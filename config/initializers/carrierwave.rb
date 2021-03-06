CarrierWave.configure do |carrierwave|
  carrierwave.cache_dir = "#{Rails.root}/tmp/carrierwave"

  if Rails.env.production?
    carrierwave.storage = :fog
    carrierwave.fog_credentials = {
       :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
       :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
       :provider => 'AWS',
       :region => ENV['S3_REGION']
     }
     carrierwave.fog_directory = ENV['S3_BUCKET']
     carrierwave.fog_public = true
     # carrierwave.fog_host = "https://s3-#{ENV['S3_REGION']}.amazonaws.com/#{ENV['S3_BUCKET']}" if Rails.env.development?

  else
    carrierwave.storage = :file
    carrierwave.enable_processing = Rails.env.development?
   end
end
