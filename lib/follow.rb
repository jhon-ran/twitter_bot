# Follows the last 20 people that used #bonjour_monde
require 'dotenv'
require 'twitter'

Dotenv.load

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

followees = []
	
	
client.search("#bonjour_monde", result_type: "recent").take(15).each do |tweet|
      followees << tweet.user.screen_name
    end

    # To show the users it will follow  
    puts	followees.uniq!

    client.follow(followees).uniq!

