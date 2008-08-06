require 'rubygems'
require 'mack_core'
require File.join(File.dirname(__FILE__), "kernel")
require File.join(File.dirname(__FILE__), "controller")

module MicroMack
  module Application
    
    class << self
      
      def method_missing(sym, *args, &block)
        url = args[0]
        action = "#{sym}_micro_mack_#{url == "/" ? "index" : url}".methodize
        MicroMackController.send(:define_method, action, &block)
        Mack::Routes.build do |r|
          r.connect url, :controller => :micro_mack, :action => action, :method => sym
        end
      end
      
    end
    
  end # Application
  
  def self.start!
    application = Mack::Utils::Server.build_app
    Rack::Handler::Mongrel.run(application, :Port => 3000)
  end
  
end # MicroMack

# require 'rubygems'
# require 'micro-mack'


