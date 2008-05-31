module Mart
  module Accounts
    class CreditCardAccount < Accounts::AbstractAccount

      property :cc_number,        String
      property :expiration_month, Integer, :length => 2
      property :expiration_year,  Integer, :length => 4
      property :credit_ccv,       Integer, :length => 5

    end
  end
end
