if defined?(Merb::Plugins)

  require 'merb-slices'
  require 'dm-validations'
  Merb::Plugins.add_rakefiles "merb_e_mart/merbtasks"

  Merb::Slices::register(__FILE__)
  Merb::Slices::config[:merb_e_mart] = { :layout => :merb_e_mart }
  
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
    end
    
  end
  
  # Setup the slice layout for MerbEMart
  #
  # Use MerbEMart.push_path and MerbEMart.push_app_path
  # to set paths to merb_e_mart-level and app-level paths. Example:
  #
  # MerbEMart.push_path(:application, MerbEMart.root)
  # MerbEMart.push_app_path(:application, Merb.root / 'slices' / 'merb_e_mart')
  # ...
  #
  # Any component path that hasn't been set will default to MerbEMart.root
  #
  # Or just call setup_default_structure! to setup a basic Merb MVC structure.
  MerbEMart.setup_default_structure!
  
end