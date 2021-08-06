require 'main'

describe AirQualityAPI do 
	describe "#get_request" do
		describe "has a valid API token" do 
			it "receives a successful response from the API" do
				city = 'Austin'
				response = AirQualityAPI.get_request(city)			
				expect(response.status).to eq 200
			end 
			
			it "receives a successful response with a valid city" do 
			end 

			it "does not receive a successful response with an invalid city" do 
			end 
		end 		

		describe "has an invalid API token" do 
			it "returns an error response status" do
			end 
		end
	end 
end
