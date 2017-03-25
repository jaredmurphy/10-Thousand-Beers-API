class TenKBeers < Sinatra::Base
  register Sinatra::CrossOrigin
  enable :cross_origin

  get "/beers" do
    PGHelper::beer_count.to_json
  end

  post "/purchase_beer" do
    text_noah
    PGHelper::update_beer_count
    PGHelper::beer_count.to_json
  end

  private 

  def text_noah
    twilio = TwilioHelper.new
    twilio.send_message
  end
end
