if defined?(Merb::Plugins)

  $:.unshift File.dirname(__FILE__)

  load_dependency 'merb-slices'
  #require 'merb-haml'
  #require 'dm-validations'
  #require 'dm-types'

  Merb::Plugins.add_rakefiles "merb_mart/merbtasks", "merb_mart/slicetasks", "merb_mart/spectasks"

  # Register the Slice for the current host application
  Merb::Slices::register(__FILE__)
  
  # Slice configuration - set this in a before_app_loads callback.
  # By default a Slice uses its own layout, so you can swicht to 
  # the main application layout or no layout at all if needed.
  # 
  # Configuration options:
  # :layout - the layout to use; defaults to :merb_mart
  # :mirror - which path component types to use on copy operations; defaults to all
  Merb::Slices::config[:merb_mart][:layout] ||= :merb_mart
  
  # All Slice code is expected to be namespaced inside a module
  module MerbMart
    
    # Slice metadata
    self.description = "MerbMart is a chunky Merb slice!"
    self.version = "0.0.1"
    self.author = "YOUR NAME"
    
    # Stub classes loaded hook - runs before LoadClasses BootLoader
    # right after a slice's classes have been loaded internally.
    def self.loaded
    end

    # Initialization hook - runs before AfterAppLoads BootLoader
    def self.init
    end
    
    # Activation hook - runs after AfterAppLoads BootLoader
    def self.activate
    end
    
    # Deactivation hook - triggered by Merb::Slices.deactivate(MerbMart)
    def self.deactivate
    end
    
    # Setup routes inside the host application
    #
    # @param scope<Merb::Router::Behaviour>
    #  Routes will be added within this scope (namespace). In fact, any 
    #  router behaviour is a valid namespace, so you can attach
    #  routes at any level of your router setup.
    #
    # @note prefix your named routes with :merb_mart_
    #   to avoid potential conflicts with global named routes.
    def self.setup_router(scope)
      scope.namespace(:admin) do |admin|
        admin.to(:controller => 'products') do |products|
          products.match('/products').to.name(:products)
        end
      end
      # example of a named route
      scope.match('/index(.:format)').to(:controller => 'main', :action => 'index').name(:index)
      # the slice is mounted at /merb_mart - note that it comes before default_routes
      scope.match('/').to(:controller => 'main', :action => 'index').name(:home)
      # enable slice-level default routes by default
      scope.default_routes
    end
    
  end
  
  # Setup the slice layout for MerbMart
  #
  # Use MerbMart.push_path and MerbMart.push_app_path
  # to set paths to merb_mart-level and app-level paths. Example:
  #
  # MerbMart.push_path(:application, MerbMart.root)
  # MerbMart.push_app_path(:application, Merb.root / 'slices' / 'merb_mart')
  # ...
  #
  # Any component path that hasn't been set will default to MerbMart.root
  #
  # Or just call setup_default_structure! to setup a basic Merb MVC structure.
  MerbMart.setup_default_structure!
  
  # Add dependencies for other MerbMart classes below. Example:
  # dependency "merb_mart/other"
  
end
