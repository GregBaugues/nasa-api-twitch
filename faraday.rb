require 'faraday'
require 'faraday_middleware'
require 'pp'

url = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/'
conn = Faraday.new(url: url) do |faraday|
  faraday.adapter Faraday.default_adapter
  faraday.response :json
end

response = conn.get('photos', sol: '1000', api_key: 'DEMO_KEY')
pp response.body