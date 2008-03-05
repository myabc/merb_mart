class Questions < Application
  
  def index
    @questions = Question.all
    
    display @questions
  end
  
end
