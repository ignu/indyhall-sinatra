require 'sinatra'
require 'haml'

get "/" do
  "Hello"
end

get "/hello/:name" do |name|
  @name = name
  haml :hello
end

__END__

@@layout
%html
  %h1
    Indy Hall Sinatra App
  %hr
    = yield
  %i

@@hello
%h1
  Hello
  =@name
