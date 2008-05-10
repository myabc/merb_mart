module Mart
  module Accounts
    class CreditCardAccount < Accounts::AbstractAccount
    
      property :cc_number,        String
      property :expiration_month, Fixnum, :length => 2
      property :expiration_year,  Fixnum, :length => 4
      property :credit_ccv,       Fixnum, :length => 5

    end
  end
end