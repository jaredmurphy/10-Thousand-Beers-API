module PGHelper
  def self.beer_count
      conn.exec("SELECT count FROM beers WHERE id=1").to_a
  end

  def self.update_beer_count
      conn.exec("Update beers SET count = count-1 WHERE id=1")
  end

  private

  def self.conn
      if ENV["RACK_ENV"] == 'production'
        @@conn ||= PG.connect(ENV["DATABASE_URL"])
      else
        @@conn ||= PG.connect(dbname: ENV["PG_DB"])
      end
  end 
end