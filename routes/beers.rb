class TenKBeers < Sinatra::Base
  register Sinatra::CrossOrigin
  enable :cross_origin

  get "/beers" do
    beer_count.to_json
  end

  post "/purchase_beer" do
    text_noah
    update_beer_count
    beer_count.to_json
  end

  private 

  def beer_count
    conn.exec("SELECT count FROM beers WHERE id=1").to_a
  end

  def update_beer_count
    conn.exec("Update beers SET count = count-1 WHERE id=1")
  end

  def text_noah
    twilio = TwilioHelper.new
    twilio.send_message
  end

  def conn
    if ENV["RACK_ENV"] == 'production'
      @@conn ||= PG.connect(ENV["DATABASE_URL"])
    else
      @@conn ||= PG.connect(dbname: ENV["PG_DB"])
    end
  end 
end
