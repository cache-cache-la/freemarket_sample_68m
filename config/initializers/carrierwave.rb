require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? # 本番環境ならAWSを使用
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'frm68m'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/frm68m'
  else
    config.storage :file # 開発環境ではpublic/uploades下に保存
    config.enable_processing = false if Rails.env.test? #test環境では処理をスキップ
  end
end





