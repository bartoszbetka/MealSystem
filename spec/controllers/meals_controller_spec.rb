require 'rails_helper'

RSpec.describe MealsController, type: :controller do
  before(:each) do
    @user = User.create(:name => "test")
    session[:user_id] = @user.id
  end
  let!(:order){Order.create(restaurantName: "Restaurant")}

  describe "POST #create" do
    it "responds to json" do
      post :create, order_id: order.id, meal: {:name => "Pizza", :price => 12.34, order_id: order.id}, :format => :json
      expect(response.content_type).to eq "application/json"
    end
    it "responds to body" do
      post :create, order_id: order.id, meal: {:name => "Pizza", :price => 12.34, order_id: order.id}, :format => :json
      expect(response.body).to match(/Pizza/)
    end
    it "returns http success" do
      post :create, order_id: order.id, meal: {:name => "Pizza", :price => 12.34, order_id: order.id}, :format => :json
      expect(response).to have_http_status(:success)
    end
    it "returns http error" do
      post :create, order_id: order.id, meal: {:name => "@!", :price => "aas", order_id: order.id}, :format => :json
      expect(response).not_to have_http_status(:success)
    end
  end
end
