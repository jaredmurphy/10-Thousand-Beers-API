class TenKBeers < Sinatra::Base
  register Sinatra::CrossOrigin
  enable :cross_origin

  get "/beers" do
    beer_count.to_json
  end

  post "/purchase_beer" do
    conn.exec("Update beers SET count = count-1 WHERE id=1")
    beer_count.to_json
  end

  private 

  def beer_count
    conn.exec("SELECT count FROM beers WHERE id=1").to_a
  end

  def conn
    if ENV["RACK_ENV"] == 'production'
      @@conn ||= PG.connect(
        dbname: ENV["POSTGRES_DB"],
        host: ENV["POSTGRES_HOST"],
        password: ENV["POSTGRES_PASS"],
        user: ENV["POSTGRES_USER"]
      )
    else
        @@conn ||= PG.connect(dbname: "10kbeers")
    end
  end 
end
