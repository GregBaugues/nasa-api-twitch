require 'rest-client'
require 'json'
require 'pp'

url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
response = RestClient.get(url)
pp JSON.parse(response)