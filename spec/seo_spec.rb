require 'spec_helper'

describe Sinatra::Seo do
  include Rack::Test::Methods
  include Sinatra::Seo::Helpers
  
  def app
    Sinatra::Application
  end
  
  context "when initialized" do
    before :all do
      set :seo_file, nil
    end
    
    it "then the :seo_file option should be null." do
      app.seo_file.should be_nil
    end
    
    it "then the seo helper method should release an error." do
      lambda{seo}.should raise_error(TypeError)
    end
  end
  
  context "when defined an existent SEO file" do
    before :all do
      File.open('./test.seo', 'w'){|file| file.write(YAML::dump(DATA))}
      
      set :seo_file, './test.seo'
    end
    
    it "then the :seo_file option should contain the path to the SEO file." do
      app.seo_file.should_not be_nil
      app.seo_file.should be_an_instance_of(String)
      app.seo_file.should == './test.seo'
    end
    
    it "then the defined :seo_file should exist and have the '.seo' extension." do
      File.exist?('./test.seo').should be_true
      File.extname(app.seo_file).should == '.seo'
    end
    
    it "then the seo helper method should include every page (with :title, :description and :keywords as sub-attributes) as a read-only attribute." do
      YAML.load_file('./test.seo').keys.each do |page|
        seo.methods.include?(page).should be_true
        seo.methods.include?(:"#{page}=").should be_false
        
        eval("seo.#{page}").should be_an_instance_of(OpenStruct)
        
        [:title, :description, :keywords].each do |attribute|
          eval("seo.#{page}.methods").include?(attribute).should be_true
          eval("seo.#{page}.methods").include?(:"#{attribute}=").should be_false
          eval("seo.#{page}.#{attribute}").should be_an_instance_of(String)
          eval("seo.#{page}.#{attribute}").should == DATA[page][attribute]
        end
      end
    end
    
    after :all do
      File.delete './test.seo'
    end
  end
end