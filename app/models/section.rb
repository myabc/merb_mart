require 'validate'

# A section is an organizational unit for content nodes.
#
# Sections can be applied to pages or snippets, but really are
# only meant for blogs.
#
class Section
  
  include DataMapper::Resource
  include DataMapper::Validate
  #include DataMapper::Is::Tree
  
  many_to_many :content_nodes
  many_to_many :blogs,
    :join_table => 'content_nodes_sections',
    :association_foreign_key => 'content_node_id',
    :conditions => "content_nodes.type = 'Blog'",
    :order => 'display_on DESC'

  property :id,         Fixnum, :serial => true
  property :name,       String, :length => 100, :default => "", :nullable => false
  property :rank,       Fixnum
  property :parent_id,  Fixnum

  validates_presence_of :name
  # FIXME: fix validates_uniqueness_of (not available yet)
  #validates_uniqueness_of :name
  # FIXME : tree
  #is_a_tree :order => 'rank' # '-rank DESC'
  
  # Most used finder function for tags.
  # Selects by alpha sort.
  def self.find_alpha
    all(:order => [ DataMapper::Query::Direction.new(:name, :asc) ])
  end
  
  # Finds ordered parent tags.
  def self.find_ordered_parents
    all(:conditions => [:parent_id => nil, :parent_id => 0], 
        :order => [ DataMapper::Query::Direction.new(:rank, :asc) ])
  end
  
  # Returns the number of products tagged with this item
  def content_count
    @cached_content_count ||= self.content_nodes.count
  end
  
end