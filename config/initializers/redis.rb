uri = URI.parse('redis://redistogo:7dd48da3ae32f9dd82e09cb9766fd97d@pike.redistogo.com:11781')
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)