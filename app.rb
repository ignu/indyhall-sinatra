require 'sinatra'
require 'haml'
require 'twitter'

get "/" do
  "Hello"
end

get "/hello/:name" do |name|
  @name = name
  haml :hello
end

get "/tweets/:term" do |term|
  @tweets = Twitter.search term
  haml :tweets
end
