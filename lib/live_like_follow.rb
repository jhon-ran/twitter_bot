# Follows & likes in real time people using #bonjour_monde
require 'dotenv'
require 'twitter'

def static_twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  return client
end

def live_twitter
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end
return client
end 

live_twitter.filter(track: "#bonjour_monde") do |object|
  static_twitter.fav object
  static_twitter.follow object.user
end

 
