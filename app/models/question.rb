class Question
  
  include DataMapper::Resource

  property :id,             Fixnum, :serial => true
  property :short_question, String
  property :long_question,  DataMapper::Types::Text
  property :answer,         DataMapper::Types::Text
  property :rank,           Fixnum
  property :featured,       TrueClass, :default => false, :nullable => false
  property :times_viewed,   Fixnum,    :default => 0,     :nullable => false
  property :created_on,     DateTime,  :nullable => false
  property :answered_on,    DateTime
  property :email_address,  String,  :length => 50
  
  # Validation
	#validates_presence_of :short_question, :message => ERROR_EMPTY
end