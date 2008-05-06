module Mart
  module Accounts
    class BankAccount < AbstractAccount

      #include DataMapper::Resource

      #property :account_subtype,  DataMapper::Types::Enum    
      property :account_number,   String
      property :routing_number,   String, :length => 20
      property :bank_name,        String, :length => 50
    
    end
  end
end