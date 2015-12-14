require 'rest-client'
require 'json'
require 'pry'

ROVERS = ['curiosity', 'opportunity', 'spirit']

def build_url(rover)
  "https://api.nasa.gov/mars-photos/api/v1/rovers/#{rover.downcase}/photos?sol=1000&api_key=DEMO_KEY"
end

def get_data(url)
  response = RestClient.get(url)
  JSON.parse(response)
end

def random_photo(rover)
  url = build_url(rover)
  data = get_data(url)
  photo_data = data["photos"].sample

  {
    camera_name:  photo_data["camera"]["full_name"],
    img_src:      photo_data["img_src"],
    earth_date:   photo_data["earth_date"],
    rover_name:   photo_data["rover"]["name"],
    landing_date: photo_data["rover"]["landing_date"]
  }
end