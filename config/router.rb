Merb.logger.info("Compiling routes...")
Merb::Router.prepare do |r|

  # Admin routes
  r.namespace :admin do |admin|
    admin.resources :content_nodes
    admin.resources :files
    admin.resources :orders
    admin.resources :preferences
    admin.resources :products
    admin.resources :promotions
    admin.resources :questions
    admin.resources :sections
    admin.resources :tags
  end

  # RESTful routes
  r.resources :users
  
  r.match("/login").to(:controller => "Sessions", :action => "create").name(:login)
  r.match("/logout").to(:controller => "Sessions", :action => "destroy").name(:logout)
  r.match("/users/activate/:activation_code").to(:controller => "Users", :action => "activate").name(:user_activation)
  
  # Change this for your home page to be available at /
  r.match('/').to(:controller => '', :action =>'index')

end
