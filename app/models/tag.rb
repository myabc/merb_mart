# Tags are how we organize products inside Substruct.
#
# Tags may be ordered, and contain other tags. In this fashion,
# they can act like old-school "categories", or new-school tagging
# systems.
#
class Tag
  
  include DataMapper::Resource
  #include DataMapper::Is::Tree
  
  many_to_many :products, :join_table => 'products_tags'
  
  property :id,         Fixnum, :serial => true
  property :name,       String, :length => 100, :default => "", :nullable => false, :key => :unique
  property :rank,       Fixnum
  property :parent_id,  Fixnum
    
  #validates_presence_of :name
  #validates_uniqueness_of :name
  
  # FIXME : fix the tree
  #is_a_tree
  #acts_as_tree :order => '-rank DESC'
  
  # Most used finder function for tags.
  # Selects by alpha sort.
  def self.find_alpha
    all(:order => [ DataMapper::Query::Direction.new("name", :asc) ])
  end
  
  # Finds ordered parent tags.
  #
  def self.find_ordered_parents
    all(:conditions => [:parent_id => nil, :parent_id => 0], 
        :order => [ DataMapper::Query::Direction.new(:rank, :desc) ])
  end
  
  # Finds a list of related tags for the tag id's passed in
  # 
  # Uses the tag ids passed in
  #   - Finds products with the tags applied (inside the subselect)
  #   - Find and returns tags also tagged to the products, but not passed in
  def self.find_related_tags(tag_id_list)
    tag_id_list_string = tag_id_list.join(",")
    sql  = "SELECT items.id "
    sql << "FROM items "
    sql << "JOIN products_tags on items.id = products_tags.product_id "
    sql << "WHERE products_tags.tag_id IN (#{tag_id_list_string}) "
    sql << "GROUP BY items.id HAVING COUNT(*)=#{tag_id_list.length};"
    items = StoreItem.find_by_sql(sql)
    
    item_ids = items.collect { |i| i.id }
    item_id_str = item_ids.join(',')
    
    if item_ids.size > 0    
      sql =  "SELECT DISTINCT t.* FROM products_tags pt, tags t WHERE pt.product_id IN(#{item_id_str})"
      sql << "AND t.id = pt.tag_id "
      sql << "AND t.id NOT IN (#{tag_id_list_string});"
      return find_by_sql(sql)
    else
      return []
    end
  end
  
  # Returns the number of products tagged with this item
  def product_count
    @cached_product_count ||= self.products.count
  end
  
end