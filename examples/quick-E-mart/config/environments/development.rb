Merb.logger.info("Loaded DEVELOPMENT Environment...")
Merb::Config.use { |c|
  c[:exception_details] = true
  c[:reload_classes] = true
  c[:reload_time] = 0.5
  c[:log_auto_flush ] = true
}

DataMapper.setup(:default, 'sqlite3::memory:')

class PopulateStore < Merb::BootLoader

  after AfterAppLoads

  def self.run
    DataMapper.auto_migrate!
    Product.create(:name => "Duff Beer", :code => "0x01", :is_discontinued => false, :date_available => Time.now)
  end

end
