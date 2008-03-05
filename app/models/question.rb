class Question < DataMapper::Base
  
  property :short_question, :string
  property :long_question,  :text
  property :answer,         :text
  property :rank,           :integer
  property :featured,       :boolean, :default => false, :nullable => false
  property :times_viewed,   :integer, :default => 0,     :nullable => false
  property :created_on,     :datetime, :nullable => false
  property :answered_on,    :datetime
  property :email_address,  :string,  :length => 50
  
  # Validation
	#validates_presence_of :short_question, :message => ERROR_EMPTY
end