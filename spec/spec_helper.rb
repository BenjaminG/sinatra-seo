require 'sinatra'
require 'rack/test'
require File.join(Dir.pwd, %w{lib sinatra seo})

set :environment, :test