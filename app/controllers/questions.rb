class Questions < Application
  
  def index
    @title = "Questions"
    #@questions = Question.all
    
    #display @questions
  end
  
  def faq
    @title = "FAQ (Frequently Asked Questions)"
    
    @questions = Question.all
    #@questions = Question.find(:all,
    #                           :conditions => "featured = 1",
    #                           :order => "-rank DESC, times_viewed DESC")
  end
  
  # Ask a question, also known as /contact
  def new
    @question = Question.new
    render
  end
  
  # Actually creates the question
  def create
    @question = Question.new(params[:question])
    @question.short_question = "Message from the contact form"
    if !@question.save then
      render :action => 'new'
    end
  end
  
end
