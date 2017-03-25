class TenKBeers < Sinatra::Base
  register Sinatra::CrossOrigin
  enable :cross_origin

  get "/beers" do
    PGHelper::beer_count.to_json
  end

  post "/purchase_beer" do
    TwilioHelper::send_message
    PGHelper::update_beer_count
    PGHelper::beer_count.to_json
  end
end
