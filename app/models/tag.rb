require 'dm-validations'

class Tag
  
  include DataMapper::Resource
  include DataMapper::Validate
  #include DataMapper::Is::Tree
  
  property :id,         Fixnum, :serial => true
  property :name,       String, :length => 100, :nullable => false, :key => :unique
  property :rank,       Fixnum
  property :parent_id,  Fixnum

  #many_to_many :products #, :join_table => 'products_tags'    
  validates_presence_of   :name
  validates_uniqueness_of :rank
  
  def self.all_ordered
    all(:order => [ :name.asc ])
  end
  
  def self.all_parents
    all(:conditions => [:parent_id => 0],  # parent_id => nil, 
        :order => [ :rank.desc ])
  end
  
end