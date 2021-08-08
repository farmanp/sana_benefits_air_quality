require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?

require_relative 'models/air_quality_index_helper'

get '/' do
  erb :index
end

get '/city_profile' do
  @city = params[:city]
  response = AirQualityIndexHelper.get_request(@city)
  @aqi_score = response['data']['aqi']
  @aqi_score_check = AirQualityIndexHelper.aqi_score_check(@aqi_score)
  transformed_response = {
    city: @city,
    aqi_score: @aqi_score,
    aqi_score_check: @aqi_score_check
  }

  json(transformed_response, encoder: :to_json, content_type: :json)
end
