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
  
  r.match('/').to(:controller => 'Store', :action => 'index')

  # Default administration mapping
  #map.connect 'admin',
  #  :controller => 'admin/orders',
  #  :action     => 'index'

  #r.match('/blog').to(:controller => 'ContentNodes', :action => 'index')
  #r.match('/blog/section/:section_name').to(:controller => 'ContentNodes', :action => 'list_by_section')
  #r.match('/blog/:name').to(:controller => 'ContentNodes', :action => 'show_by_name')
  
  #  map.connect '/store/show_by_tags/*tags',
  #    :controller => 'store',
  #    :action     => 'show_by_tags'

  # For things like /about_us, etc
  #r.match('/:name').to(:controller => 'ContentNodes', :action => 'show_by_name')
  
end
