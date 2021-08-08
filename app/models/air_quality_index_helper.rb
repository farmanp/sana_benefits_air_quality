require 'net/http'
require 'faraday'
require 'json'
require 'dotenv/load'

module AirQualityIndexHelper
  GOOD = 'Good'.freeze
  MODERATE = 'Moderate'.freeze
  UNHEALTHY_FOR_SENSITIVE_GROUPS = 'Unhealthy for Sensitive Groups'.freeze
  UNHEALTHY = 'Unhealthy'.freeze
  VERY_UNHEALTHY = 'Very Unhealthy'.freeze
  HAZARDOUS = 'Hazardous'.freeze
  BASE_URI = ENV['AQI_FEED_URL']
  TOKEN = ENV['AQI_TOKEN']

  def self.get_request(city)
    token_query = "?token=#{TOKEN}"
    response = Faraday.get "#{BASE_URI}/#{city}/#{token_query}"
    JSON.parse(response.body)
  end

  def self.request(_method, uri, _token)
    Faraday.method uri.to_s
  end

  def self.aqi_score_check(aqi_score)
    # The score is between 0 and 50 because the
    # Air Quality Index defines this range as a good aqi score
    case aqi_score
    when 0..50
      GOOD
    when 51..100
      MODERATE
    when 101..150
      UNHEALTHY_FOR_SENSITIVE_GROUPS
    when 201..300
      UNHEALTHY
    when 301..999
      HAZARDOUS
    else
      "The number you provided, #{aqi_score} is not an acceptable score."
    end
  end
end

