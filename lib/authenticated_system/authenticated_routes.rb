# Put the correct routes in place
module AuthenticatedSystem
  def self.add_routes
    Merb::BootLoader.after_app_loads do
      Merb::Router.prepend do |r|
        r.match("/login").to(:controller => "Session", :action => "create").name(:login)
        r.match("/logout").to(:controller => "Session", :action => "destroy").name(:logout)
        r.resources :users
        r.resources :session
      end
    end
  end
end
