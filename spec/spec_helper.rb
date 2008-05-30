require 'rubygems'
require 'merb-core'
require 'spec'
require 'data_mapper'
require 'can_has_fixtures'

# Add the dependency in a before_app_loads hook
Merb::BootLoader.before_app_loads { require(File.join(File.dirname(__FILE__), '..', 'lib', 'merb-E-mart')) }

DataMapper.setup(:default, 'sqlite3::memory:')

# Using Merb.root below makes sure that the correct root is set for
# - testing standalone, without being installed as a gem and no host application
# - testing from within the host application; its root will be used

Merb.start_environment(
  :testing => true, 
  :adapter => 'runner', 
  :environment => ENV['MERB_ENV'] || 'test',
  :merb_root => Merb.root
)

module Merb
  module Test
    module SliceHelper
      
      # The absolute path to the current slice
      def current_slice_root
        @current_slice_root ||= File.expand_path(File.join(File.dirname(__FILE__), '..'))
      end
      
      # Whether the specs are being run from a host application or standalone
      def standalone?
        not $SLICED_APP
      end
      
    end
  end
end

Spec::Runner.configure do |config|
  config.include(Merb::Test::ViewHelper)
  config.include(Merb::Test::RouteHelper)
  config.include(Merb::Test::ControllerHelper)
  config.include(Merb::Test::SliceHelper)
end

require File.join(File.dirname(__FILE__), 'spec_fixtures')

class Random
  def country_code(options = {:used => true, :unique => true})
    code = 2.of {('a'..'z').random}.to_s until satisfies?(code, options)
    
    @@used << code if options[:used]
    code
  end
  
  def address
    "#{rand(100_000)} #{word(:max => 75)} #{%w[st rd ln ave pkwy].random}"
  end

  def phone_number
    "#{(100..999).random}-#{(100..999).random}-#{(0..9999).random}"
  end
end