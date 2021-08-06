require 'net/http'
require 'faraday'
require 'json'
require 'dotenv/load'

module AirQualityIndexHelper
	GOOD_AQI = 'Good'
	BAD_AQI = 'Bad'
	BASE_URI = ENV['AQI_BASE_URL']
	TOKEN = ENV['AQI_TOKEN']
	# def initialize 
	# 	@base_uri = 'https://api.waqi.info/feed'
	# 	@token = '3a0d0de300f2bfde02af82c7ec7e03109d4e5244'
	# end 
	def self.get_request(city)
		token_query = "?token=#{TOKEN}"
		response = Faraday.get "#{BASE_URI}/#{city}/#{token_query}"
		transform_response = JSON.parse(response.body)
	end 


	def self.request(method, uri, token)
		Faraday.method "#{uri}"
	end 	

	def self.is_good_aqi?(aqi_score)
		# The score is between 0 and 50 because the 
		# Air Quality Index defines this range as a good aqi score
		aqi_score.between?(0, 50) 
	end 

	def self.aqi_score_check(aqi_score)
		is_good_aqi?(aqi_score) ? GOOD_AQI : BAD_AQI
	end 
end 

