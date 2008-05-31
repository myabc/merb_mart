require 'dm-validations'

module Mart
  module Accounts
    class AbstractAccount

      include DataMapper::Resource
      include DataMapper::Validate
      require 'ezcrypto'

      property :id,           Integer, :serial => true
      property :type,         Class   # single-table inheritance
      property :order_id,     Integer  # foreign-key
      property :customer_id,  Integer  # foreign-key

      has 1, :order
      belongs_to :customer #, :accessor => :protected

      def self.months
        (1..12).to_a
      end

      def self.years
        year = Date.today.year
        years = Array.new
        (0..9).each do |n|
          years << year + n
        end
        years
      end

    end
  end
end
