require 'sinatra/base'
require 'yaml'
require 'ostruct'

class OpenStruct
  def new_ostruct_member(name)
    name = name.to_sym
    
    unless self.respond_to?(name)
      class << self; self; end.class_eval do
        define_method(name) {@table[name].is_a?(Hash) ? OpenStruct.new(@table[name]) : @table[name]}
      end
    end
  end
end

module Sinatra
  module Seo
    module Helpers
      def seo
        @seo ||= app.nil? ? OpenStruct.new(YAML.load_file(self.class.seo_file)) : 
                            OpenStruct.new(YAML.load_file(app.seo_file))
      end
    end
    
    def self.registered(app)
      app.helpers Seo::Helpers
      
      app.set :seo_file, nil
    end
  end
  
  register Seo
end