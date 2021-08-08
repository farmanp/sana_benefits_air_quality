require 'net/http'
require 'faraday'
require 'json'
require 'dotenv/load'

module AirQualityIndexHelper
  GOOD_AQI = 'Good'
  BAD_AQI = 'Bad'
  BASE_URI = ENV['AQI_FEED_URL']
  TOKEN = ENV['AQI_TOKEN']

  def self.get_request(city)
    token_query = "?token=#{TOKEN}"
    response = Faraday.get "#{BASE_URI}/#{city}/#{token_query}"
    transform_response = JSON.parse(response.body)
  end

  def self.request(_method, uri, _token)
    Faraday.method uri.to_s
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
