require 'sinatra'
require "sinatra/reloader" if development?

require_relative "models/air_quality_index_helper"

get '/' do	
	erb :index	
end

get '/city_profile' do
	@city = params[:city]
	response = AirQualityIndexHelper.get_request(@city)
	@aqi_score = response["data"]["aqi"] 
	@aqi_score_check = AirQualityIndexHelper.aqi_check(@aqi_score)

	erb :city_profile
end 