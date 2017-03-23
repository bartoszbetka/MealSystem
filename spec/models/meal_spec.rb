require 'rails_helper'

RSpec.describe Meal, type: :model do
  let!(:meal){Meal.new(name: "Pizza", price: '12.55')}

  describe "Test validation attribute name " do
    it "meal should be valid" do
      expect(meal).to be_valid
    end
    it "should be present" do
      meal.name = "    "
      expect(meal).not_to be_valid
    end
    it "should not to be too long" do
      meal.name = "a" * 51
      expect(meal).not_to be_valid
    end
    it "should contain only letters and whitespace" do
      meal.name = "<>"
      expect(meal).not_to be_valid
    end

  end

  describe "Test validation attribute price" do
    it "should be present" do
      meal.price = "   "
      expect(meal).not_to be_valid
    end
    it "should contain only numbers and dot" do
      meal.price = "dsada"
      expect(meal).not_to be_valid
    end
    it "should contain only numbers with two decimal places" do
      meal.price = 18.955
      expect(meal.price).to eq(18.96)
    end
    it "should not to be too high" do
      meal.price = 1000
      expect(meal).not_to be_valid
    end
    it "should not to be too low" do
      meal.price = -2
      expect(meal).not_to be_valid
    end

  end
end
