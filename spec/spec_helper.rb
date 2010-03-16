require 'sinatra'
require 'rack/test'
require File.join(Dir.pwd, %w{lib sinatra seo})

set :environment, :test
enable :raise_errors

DATA = {:test1 => { :title => lambda{word = ""; 50.times{word += "t"}; word}.call, 
                    :description => lambda{word = ""; 150.times{word += "d"}; word}.call, 
                    :keywords => lambda{word = ""; 10.times{word += "k, "}; word}.call }, 
        :test2 => { :title => lambda{word = ""; 60.times{word += "t"}; word}.call, 
                    :description => lambda{word = ""; 160.times{word += "d"}; word}.call, 
                    :keywords => lambda{word = ""; 15.times{word += "k, "}; word}.call }, 
        :test3 => { :title => lambda{word = ""; 70.times{word += "t"}; word}.call, 
                    :description => lambda{word = ""; 170.times{word += "d"}; word}.call, 
                    :keywords => lambda{word = ""; 20.times{word += "k, "}; word}.call }}
                    
