module DbHelper

private

def conn
    if ENV["RACK_ENV"] == 'production'
      @@conn ||= PG.connect(ENV["DATABASE_URL"])
    else
      @@conn ||= PG.connect(dbname: ENV["PG_DB"])
    end
  end 
end