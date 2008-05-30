if defined?(Merb::Plugins)

  require 'merb-slices'
  require 'merb-haml'
  require 'dm-validations'
  require 'dm-types'

  require 'lib/merb-E-mart/exceptions/mixin_missing'
  Merb::Plugins.add_rakefiles "merb-E-mart/merbtasks"

  # Register the Slice for the current host application
  Merb::Slices::register(__FILE__)
  
  # Slice configuration - set this in a before_app_loads callback.
  # By default a Slice uses its own layout, so you can swicht to 
  # the main application layout or no layout at all if needed.
  # 
  # Configuration options:
  # :layout - the layout to use; defaults to :merb_E_mart
  # :mirror - which path component types to use on copy operations; defaults to all
  Merb::Slices::config[:merb_E_mart] = { :layout => :merb_E_mart }
  
  # All Slice code is expected to be namespaced inside a module
  module MerbEMart
    
    # Slice metadata
    self.description = "MerbEMart is a chunky Merb slice!"
    self.version = "0.0.1"
    self.author = "YOUR NAME"
    
    # Initialization hook - runs before AfterAppLoads BootLoader
    def self.init
    end
    
    # Activation hook - runs after AfterAppLoads BootLoader
    def self.activate
    end
    
    # Deactivation hook - triggered by Merb::Slices#deactivate
    def self.deactivate
    end
    
    # Setup routes inside the host application
    #
    # @param scope<Merb::Router::Behaviour>
    #  Routes will be added within this scope (namespace). In fact, any 
    #  router behaviour is a valid namespace, so you can attach
    #  routes at any level of your router setup.
    def self.setup_router(scope)
      scope.namespace(:admin) do |admin|
        admin.to(:controller => 'products') do |products|
          products.match('/products').to.name(:products)
        end
      end
    end
    
  end
  
  # Setup the slice layout for MerbEMart
  #
  # Use MerbEMart.push_path and MerbEMart.push_app_path
  # to set paths to merb-E-mart-level and app-level paths. Example:
  #
  MerbEMart.push_path(:application, MerbEMart.root)
  MerbEMart.push_app_path(:application, Merb.root / 'slices' / 'merb-E-mart')
  # ...
  #
  # Any component path that hasn't been set will default to MerbEMart.root
  #
  # Or just call setup_default_structure! to setup a basic Merb MVC structure.
  MerbEMart.setup_default_structure!
  
end