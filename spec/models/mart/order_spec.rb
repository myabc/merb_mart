require File.join( File.dirname(__FILE__), "..", "..", "spec_helper" )

describe Mart::Order do

  before(:each) do
    @order = Mart::Order.new
  end

  describe "associations" do
    it "should have an account"
    it "should have a billing address"
    it "should have a shipping address"
  end

  it "should be valid" do
    @order.order_number = 23
    @order.should be_valid
  end

  it "should have a total"
  
  describe "class methods" do
    
    it "should return a search result" do
      pending
    end
    
    it "should generate an order number" do
      Mart::Order.generate_order_number
      
      pending
    end
    
    it "should get totals"

    it "should get CSV for orders" do
      order1 = Mart::Order.new
      order2 = Mart::Order.new
      order_list = Array.new
      #order_list << [order1, order2]
      order_list << Mart::Order.new
      order_list << Mart::Order.new
      order_list.should_not == nil
      @csv = Mart::Order.get_csv_for_orders(order_list)
    end
    
    it "should get XML for orders" do
      order1 = Order.new
      order2 = Order.new
      order_list = Array.new
      order_list << Mart::Order.new
      order_list << Mart::Order.new
      order_list.should_not == nil
      @xml = Mart::Order.get_xml_for_orders(order_list)
    end
    
    it "should get order status"    
    
  end
  
  it "should assign line items from a hash"
  
  it "should get the total amount of all line items associated with this order"

  it "should test weight"

  it "should connect to FedEx to get shipping prices"

  it "should work for a valid transaction"
  it "should not work for an invalid transaction"

  it "should clean up" 
  it "should not cleanup"

  it "should belong to an order account"
  
  it "should belong to an order user"
  
  it "should belong to an order shipping type"
  
  it "should belong to an order status code"
  
  it "should belong to a promotion"

  it "should have a unique order number"

end