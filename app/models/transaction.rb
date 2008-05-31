class Transaction
  include DataMapper::Resource

  property :id,           Integer, :serial => true
  property :status,       DM::Enum[:pending, :authorized, :paid, :declined]
  property :reference,    String
  property :message,      String
  property :params,       DM::Yaml
  property :created_at,   DateTime
  property :updated_at,   DateTime
  property :amount,       BigDecimal
  property :order_id,     Integer
  property :account_id,   Integer

  belongs_to :order
  belongs_to :account

  validates_present :order, :account
end