require "pry"
require "sinatra"
require "sinatra/cross_origin"
require "pg"
require "twilio-ruby"
require 'dotenv/load'

configure do
  enable :cross_origin
end

class TenKBeers < Sinatra::Base
  set :root, File.dirname(__FILE__)
end

require_relative "routes/beers"
require_relative "helpers/twilio"
Dotenv.load('keys.env')


