Merb::Config.use do |c|
  c[:session_store] = "memory"
end

[Merb::Test::ControllerHelper, Merb::Test::ViewHelper, Merb::Test::RouteHelper].each do |m|
  Merb::Test::Helpers.send(:include, m)
end

class Merb::Mailer
  self.delivery_method = :test_send
end

class Hash
  
  def with( opts )
    self.merge(opts)
  end
  
  def without(*args)
    self.dup.delete_if{ |k,v| args.include?(k)}
  end
  
end
