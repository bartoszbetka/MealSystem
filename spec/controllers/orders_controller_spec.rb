require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index, {:format => :json}
      expect(response).to have_http_status(:success)
    end
    it "responds to json" do
      get :index, {:format => :json}
      expect(response.content_type).to eq "application/json"
    end

  end
  describe "GET #active" do
    it "returns http success" do
      get :active, {:format => :json}
      expect(response).to have_http_status(:success)
    end
    it "responds to json" do
      get :active, {:format => :json}
      expect(response.content_type).to eq "application/json"
    end
  end
  describe "GET #history" do
    it "returns http success" do
      get :history, {:format => :json}
      expect(response).to have_http_status(:success)
    end
    it "responds to json" do
      get :history, {:format => :json}
      expect(response.content_type).to eq "application/json"
    end
  end

  describe "POST #create" do
    before(:each) do
      @user = User.create(:name => "test")
      session[:user_id] = @user.id
    end

    it "responds to json" do
      post :create, { :order => {:restaurantName => "Restaurant"}, :format => :json}
      expect(response.content_type).to eq "application/json"
    end
    it "responds to body" do
      post :create, { :order => {:restaurantName => "Restaurant"}, :format => :json}
      expect(response.body).to match(/Restaurant/)
    end

    it "returns http success" do
      post :create, { :order => {:restaurantName => "Restaurant"}, :format => :json}
      expect(response).to have_http_status(:success)
    end

  end


end
