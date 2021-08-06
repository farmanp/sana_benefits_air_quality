require 'main'

describe AirQualityIndexHelper do 
	describe "#get_request" do
		describe "has a valid API token" do 
			it "receives a successful response from the API" do
				city = 'Austin'
				response = AirQualityAPI.get_request(city)			
				expect(response["status"]).to eq "ok"
			end 
			
			it "receives an AQI score with a valid city" do 
				city = 'Austin'
				response = AirQualityAPI.get_request(city)	
				expect(response["data"]["aqi"].class).to be Integer
			end 

			it "does not receive a successful response with an invalid city" do 
				city = 'Austina'
				response = AirQualityAPI.get_request(city)	
				expect(response["status"]).to eq "error"
			end 
		end 		

		describe "has an invalid API token" do 
			it "returns an error response status" do
				# TODO: Finish test
			end 
		end
	end 
end
