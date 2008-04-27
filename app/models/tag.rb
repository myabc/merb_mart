require 'validate'

class Tag
  
  include DataMapper::Resource
  include DataMapper::Validate
  #include DataMapper::Is::Tree
  
  property :id,         Fixnum, :serial => true
  property :name,       String, :length => 100, :nullable => false, :key => :unique
  property :rank,       Fixnum
  property :parent_id,  Fixnum

  many_to_many :products, :join_table => 'products_tags'    
  validates_presence_of :name
  #validates_uniqueness_of :name
  
  def self.find_alpha
    all(:order => [ DataMapper::Query::Direction.new("name", :asc) ])
  end
  
  def self.find_ordered_parents
    all(:conditions => [:parent_id => nil, :parent_id => 0], 
        :order => [ DataMapper::Query::Direction.new(:rank, :desc) ])
  end
  
end