require 'spec_helper'

describe Sinatra::Seo do
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end
end