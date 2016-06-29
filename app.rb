require 'sinatra'
require 'sinatra/activerecord'

require './models/update' #Update class
require './config/environments' #database configuration

get '/' do
    "Things appear to be okay."
end