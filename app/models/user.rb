require 'digest/sha1'
require "date"
require "dm-aggregates"
require "dm-validations"
begin
  require File.join(File.dirname(__FILE__), '..', '..', "lib", "authenticated_system", "authenticated_dependencies")
rescue
  nil
end
class User

  include DataMapper::Resource
  include AuthenticatedSystem::Model

  attr_accessor :password, :password_confirmation

  property :id,                         Fixnum,   :serial => true
  property :login,                      String,   :unique => true
  property :email,                      String
  property :crypted_password,           String
  property :salt,                       String
  property :activation_code,            String
  property :activated_at,               DateTime
  property :remember_token_expires_at,  DateTime
  property :remember_token,             String
  property :created_at,                 DateTime
  property :updated_at,                 DateTime

  validates_length        :login,                   :within => 3..40
  validates_is_unique     :login
  validates_present       :email
  validates_format        :email,                   :as => :email_address
  validates_length        :email,                   :within => 3..100
  validates_is_unique     :email
  validates_present       :password,                :if => lambda { |r| r.password_required? }
  validates_present       :password_confirmation,   :if => lambda { |r| r.password_required? }
  validates_length        :password,                :within => 4..40, :if => lambda { |r| r.password_required? }
  validates_is_confirmed  :password#,                :groups => :create

  before :save,   :encrypt_password
  #before_class_method :create, :make_activation_code
  #after_class_method  :create, :send_signup_notification

  def login=(value)
    @login = value.downcase unless value.nil?
  end

  EMAIL_FROM = "info@mysite.com"
  SIGNUP_MAIL_SUBJECT = "Welcome to MYSITE.  Please activate your account."
  ACTIVATE_MAIL_SUBJECT = "Welcome to MYSITE"

  # Activates the user in the database
  def activate
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save

    # send mail for activation
    UserMailer.dispatch_and_deliver(  :activation_notification,
                                  {   :from => User::EMAIL_FROM,
                                      :to   => self.email,
                                      :subject => User::ACTIVATE_MAIL_SUBJECT },

                                      :user => self )

  end

  #def send_signup_notification
  #  UserMailer.dispatch_and_deliver(
  #      :signup_notification,
  #    { :from => User::EMAIL_FROM,
  #      :to  => self.email,
  #      :subject => User::SIGNUP_MAIL_SUBJECT },
  #      :user => self
  #  )
  #end

end
