require 'sinatra/base'
require 'yaml'

module Sinatra
  module Seo
    module Helpers
      def seo
        @seo ||= begin
          @seo = YAML.parse_file(app.seo_file)
        end
      end
    end
    
    def self.registered(app)
      app.helpers Seo::Helpers
      
      app.set :seo_file, nil
    end
  end
  
  register Seo
end