require 'spec_helper'

describe Sinatra::Seo do
  include Rack::Test::Methods
  include Sinatra::Seo::Helpers
  
  def app
    Sinatra::Application
  end
  
  context "when initialized" do
    it "the :seo_file option should be null." do
      app.seo_file.should be_nil
    end
    
    it "the seo helper should release an error." do
      lambda{seo}.should raise_error(TypeError)
    end
  end
end