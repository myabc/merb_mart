class ContentNodes < Application
  #provides :html, :xml
  
  def show
    @content_node = ContentNode[params[:id]]
  end
  
  # Shows an entire page of content by name
  def show_by_name
    #@content_node = ContentNode.with_slug(id)
    @content_node = ContentNode.first(:name => params[:name])
    raise NotFound unless @content_node
    
    # Set a title
    if @content_node.title.blank? then
      @title = @content_node.name.capitalize
    else
      @title = @content_node.title
    end
    
    # Render special template for blog posts
    #if @content_node.type == Blog then
    #  render(:template => 'content_nodes/blog_post')
    #else # Render basic template for regular pages
    #  render(:layout => 'main')
    #end
    
    display @content_node
  end
  
  # Shows a snippet of content
  def show_snippet
    @content_node = Snippet.first(:name => params[:name])
    display @content_node
  end
  
  # Shows all blog content nodes.
  def index
    @title = "Blog"
    @content_nodes = Blog.all
    
    #@content_nodes = Blog.paginate(
    #  :conditions => 'display_on <= CURRENT_DATE',
    #  :page => params[:page],
    #  :per_page => 5,
    #  :order => 'display_on DESC, created_on DESC'
    #)
    
    display @content_nodes
  end
  
  def list_by_section
    # Find section, if no section 404...
    #@section = Section.find_by_name(params[:section_name])
    @section = Section.first(:name => params[:section_name])
    raise NotFound unless @section
    
    @title = "Blog entries for #{@section.name}"
    
    display @section
  end
  
  # List blog entries by section
  
  private
    # Sets the sections instance variable
    #
    def set_sections
      @sections = Section.find_ordered_parents
    end
  
end
