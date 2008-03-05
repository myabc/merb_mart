# ContentNode is the base class for all of our content.
#
class ContentNode < DataMapper::Base
  
  #belongs_to :content_node_type
  has_and_belongs_to_many :sections

  TYPES = ['Blog', 'Page', 'Snippet']
  
  property :name,       :string,  :length => 200, :default => "", :nullable => false
  property :title,      :string,  :length => 100, :default => "", :nullable => false
  property :content,    :text
  property :display_on, :datetime
  property :created_on, :datetime
  #property :type -- datamapper should handle this for us
  
  
  #############################################################################
  # VALIDATION
  #############################################################################

  #validates_presence_of :name, :title, :content

#  validates_uniqueness_of :name, :message => 'This URL has already been taken. Create a unique URL please.'

#  before_validation :normalize

  def normalize
    self.name.downcase!
    # replace quotes by nothing 
    self.name.gsub!(/['"]/, '') 
    # strip all non word chars 
    self.name.gsub!(/\W/, ' ') 

    # replace all white space sections with an underscore 
    self.name.gsub!(/\ +/, '_') 
    # trim underscores
    self.name.gsub!(/(_)$/, '') 
    self.name.gsub!(/^(_)/, '') 
    self.name.strip!
    self.name
  end

  #############################################################################
  # INSTANCE METHODS
  #############################################################################

  # Defined to save sections from edit view
  def sections=(list)
    sections.clear
    for id in list
      sections << Section.find(id) if !id.empty?
    end
  end

  # URL is just a synonym for name
  def url
    self.name
  end

  # Lets us know if this is a blog post or not
  def is_blog_post?
    self.content_node_type_id == 1
  end

end