require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?

require_relative 'models/air_quality_index_helper'

set :allow_origin, 'http://localhost:4567/'
set :allow_methods, 'GET,HEAD,POST'
set :allow_headers, 'content-type,if-modified-since'
set :expose_headers, 'location,link'

get '/' do
  erb :index
end

get '/city_profile' do
  response['Access-Control-Allow-Origin'] = '*'

  @city = params[:city]
  response = AirQualityIndexHelper.get_request(@city)
  @aqi_score = response['data']['aqi']
  @aqi_score_check = AirQualityIndexHelper.aqi_score_check(@aqi_score)

  erb :city_profile
end
