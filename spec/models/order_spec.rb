require 'rails_helper'

RSpec.describe Order, type: :model do
  let!(:order){Order.new(restaurantName: "Restaurant")}

  describe "Test validation attributes restaurantName" do

    it "order should be valid" do
      expect(order).to be_valid
    end
    it "restaurantName should be present" do
      order.restaurantName = "     "
      expect(order).not_to be_valid
    end

    it "restaurantName should not be too short" do
      order.restaurantName = "a"
      expect(order).not_to be_valid
    end

    it "restaurantName should not be too long" do
      order.restaurantName = "a" * 51
      expect(order).not_to be_valid
    end

    it "restaurantName should contain only letters, numbers and whitespace" do
      order.restaurantName = "@"
      expect(order).not_to be_valid
    end

  end

end
