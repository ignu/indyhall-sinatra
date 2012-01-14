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

__END__

@@layout
%html
  %h1
    Indy Hall Sinatra App
  %hr
    = yield
  %i

@@tweets
-@tweets.each do |tweet|
  %img{:src => tweet['profile_image_url']}
  %b
    =tweet['from_user']
  =tweet['text']
  %hr

@@hello
%h1
  Hello
  =@name
