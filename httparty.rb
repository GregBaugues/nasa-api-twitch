require 'httparty'
require 'pp'

url = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY'
response = HTTParty.get(url)
pp response.parsed_response