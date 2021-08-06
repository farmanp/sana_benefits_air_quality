require 'net/http'
require 'faraday'

module AirQualityAPI
	def self.get_request(city)
		base_uri = 'https://api.waqi.info/feed'
		token = '3a0d0de300f2bfde02af82c7ec7e03109d4e5244'
		token_query = "?token=#{token}"
		response = Faraday.get "https://api.waqi.info/feed/#{city}/#{token_query}"
	end 

	# def request(method, url, timeout=nil)
	# 	options = {
	# 		base_uri: 'https://api.waqi.info/feed',
	# 		headers: {
	# 			'Content-Type' => 'application/json', 
	# 		}					
	# 	}

	# 	Faraday.method url/
	# end 
end 
