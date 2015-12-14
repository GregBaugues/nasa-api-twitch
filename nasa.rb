require 'rest-client'
require 'json'
require 'pry'
require 'pp'

url = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY'
response = RestClient.get(url)
data = JSON.parse(response)
photo_urls = data["photos"].collect { |photo| photo["img_src"] }
pp data
pp photo_urls

