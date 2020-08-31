CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIA4VJODXWFKQK2GR7Y',
    aws_secret_access_key: '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',
    region: 'us-east-2',
    path_style: true
  }
  config.fog_directory = 'panndora-vids'
end