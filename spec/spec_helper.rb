require 'sinatra'
require 'rack/test'
require File.join(Dir.pwd, %w{lib sinatra seo})

set :environment, :test
enable :raise_errors

DATA = {:test1 => {:title => 'Title1', :description => 'Description1', :keywords => 'Keywords1'}, 
        :test2 => {:title => 'Title2', :description => 'Description2', :keywords => 'Keywords2'}, 
        :test3 => {:title => 'Title3', :description => 'Description3', :keywords => 'Keywords3'}}