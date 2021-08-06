require 'net/http'
require 'faraday'
require 'json'

module AirQualityAPI
	GOOD_AQI = 'Good'
	BAD_AQI = 'Bad'
	BASE_URI = 'https://api.waqi.info/feed'
	TOKEN = '3a0d0de300f2bfde02af82c7ec7e03109d4e5244'

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
		aqi_score.between?(0, 50) 
	end 

	def self.aqi_check(aqi_score)
		is_good_aqi?(aqi_score) ? GOOD_AQI : BAD_AQI
	end 

	def render_details(response)
		sleep(0.5)
		city = "Denver"
		sleep(0.5)
		p "You have entered: #{city}"
		response = AirQualityAPI.get_request(city)
		sleep(0.5)
		air_quality_score = response["data"]["aqi"]
		p "Here is the information on the air quality for: #{city}"
		p "PQI: #{air_quality_score}"
		sleep(0.5)
		p "Is it good air quality?"
		sleep(0.5)
		p AirQualityAPI.aqi_check(air_quality_score)
	end 
end 

