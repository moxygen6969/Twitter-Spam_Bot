#!/usr/bin/env ruby
require 'jumpstart_auth'
require 'bitly'
#url shortener

Bitly.use_api_version_3


OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger"
    @client = JumpstartAuth.twitter
  end
  
  def tweet(message)  
      @client.update(message)
  end
  
  def run
    puts "Welcome to the JSL Twitter Client!"
    command = ""
    while command != "q"
      printf "enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]
      case command
       when 'q' then puts "Goodbye!"
       when 't' then tweet(parts[1..-1].join(" "))
       when 'dm' then dm(parts[1], parts[2..-1].join(" "))
       when 'ls' then puts followers_list
       when 'spam' then spam_my_followers(parts[1..-1].join(" "))
       when 'elt' then everyones_last_tweet
       when 's' then shorten(parts[1..-1].join)
       when 'turl' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
       else
        puts "Sorry, I don't know how to #{command}"
      end
    end
  end
  
  def dm(target, message)
    screen_names = @client.followers.collect { |follower| follower.screen_name }
    puts "Trying to send #{target} this direct message:"
    puts message
    message = "d @#{target} #{message}"
    if screen_names.include?("#{target}")   
     tweet(message)
    else
     puts "you can only DM people who follow you"
    end
  end
  
  def followers_list
    screen_names=[]
    @client.followers.each {|follower| screen_names << follower["screen_name"]}
    return screen_names
  end
  
  def spam_my_followers(message)
    followers = followers_list
    followers.each {|f| dm(f,message)}
  end
  
  def everyones_last_tweet
    friends = @client.friends.sort_by { |friend| friend.screen_name.downcase }
    friends.each do |friend|
      timestamp = friend.status.created_at
      puts "#{friend.screen_name.upcase} (#{timestamp.strftime("%b %d")}): #{friend.status.text}"
    end
  end
  
  def shorten(original_url)
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
    puts "Shortening this URL: #{original_url}"
    return bitly.shorten(original_url).short_url
  end
  
  
end

blogger = MicroBlogger.new
blogger.run
pause_var=gets.chomp
#9291451