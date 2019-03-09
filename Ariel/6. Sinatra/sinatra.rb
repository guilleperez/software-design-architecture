 require 'sinatra'
 
 set :bind, "0.0.0.0" #use from away the computer
 
 get '/' do
     'Hello world!'
 end