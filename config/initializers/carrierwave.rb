CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: env['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: env['AWS_ACCESS_KEY_ID'],
    region: 'us-east-2',
    path_style: true
  }
  config.fog_directory = 'panndora-vids'
end