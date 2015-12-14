require 'sinatra'
require_relative "./nasa.rb"

def create_message(data)
  msg = "This photo was taken on #{data[:earth_date]} by the #{data[:camera_name]} camera on the #{data[:rover_name]} rover which landed on Mars on #{data[:landing_date]}."
end

post '/message' do

  inbound_body = params["Body"]

  if ROVERS.include?(inbound_body.downcase)
    data = random_photo(inbound_body)
    message = create_message(data)
    img_src = data[:img_src]
  else
    rover = ROVERS.sample
    data = random_photo(rover)
    message = create_message(data)
    img_src = data[:img_src]

    message += "\n\n You can text 'curiosity', 'spirit' or 'opportunity' to choose the rover from which you'd like pictures."
  end

  content_type "text/xml"
  "<Response>
    <Message>
      <Body>#{message}</Body>
      <Media>#{img_src}</Media>
    </Message>
  </Response>"
end



