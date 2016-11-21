CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.secrets.aws_key,
    aws_secret_access_key: Rails.application.secrets.secret_key,
    region: 'Ireland'

  }

  config.cache_dir = "#{Rails.root}/tmp/uploads"

  config.fog_directory = "kelpimages"
  # config.s3_access_policy = :public_read

end
