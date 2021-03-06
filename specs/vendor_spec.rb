require_relative './spec_helper'

describe FarMar::Vendor do
  it "is an object that is an instance of a Class" do
    FarMar::Vendor.must_be_instance_of Class
  end

  describe "FarMar::Vendor#self.all" do
    it "should return an incredibly large array" do
      FarMar::Vendor.all.must_be_instance_of Array
    end
  end

  describe "FarMar::Vendor#self.find" do
    it "should return 'Jakubowski-Robel' when id 32 passed in" do
      FarMar::Vendor.find(32).name.must_equal "Jakubowski-Robel"
    end

    it "should return nil when self.find called by id 3000" do
      FarMar::Vendor.find(3000).must_equal nil
    end

  end

  describe "FarMar::Vendor#markets" do
    vendor1 = FarMar::Vendor.new(market_id: 10)
    it "should return the market name Saratoga Farmers' Market w/id 10" do
      vendor1.markets.name.must_equal "Saratoga Farmers' Market"
    end
  end

  describe "FarMar::Vendor#products" do
    vendor2 = FarMar::Vendor.new(id: 26)
    it "should return 3 markets associated with vendor id 26" do
      vendor2.products.length.must_equal 3
    end
  end

  describe "FarMar::Vendor#sales" do
    vendor3 = FarMar::Vendor.new(id: 14)
    it "should return 3 sales for vendor_id 14" do
      vendor3.sales.length.must_equal 3
    end
  end

  describe "FarMar::Vendor#revenue" do
    vendor4 = FarMar::Vendor.new(id: 15)
    it "should return total reveue for sales per vendor id" do
      vendor4.revenue.must_equal 43414
    end
  end

  describe "FarMar::Vendor#self.by_market" do
    it "should return array of vendors by market when given market_id" do
      FarMar::Vendor.by_market(4).length.must_equal 4
    end
  end

  # describe "FarMar::Vendor#self.most_revenue(n)" do
  #   it "should return top n vendor instances ranked by revenue" do
  #     FarMar::Vendor.most_revenue(4).length.must_equal 4
  #   end
  # end

end
