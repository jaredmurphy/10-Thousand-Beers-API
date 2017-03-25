require "json"
require "nokogiri"
require "open-uri"
require "pry"
require "sinatra"
require "sinatra/namespace"
require "sinatra/reloader"
require "sinatra/cross_origin"
require "pg"

configure do
  enable :cross_origin
end

class TenKBeers < Sinatra::Base
  set :root, File.dirname(__FILE__)
  register Sinatra::Namespace
end

require_relative "routes/beers"
