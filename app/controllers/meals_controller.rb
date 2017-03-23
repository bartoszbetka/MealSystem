class MealsController < ApplicationController
  before_action :confirm_logged_in, only: :create
  before_action :meal_check, only: :create
  before_action :status_check, only: :create

  def create
    order=Order.find(params[:order_id])
    meal= order.meals.create(meal_params.merge(user_id: current_user.id))
    respond_with order, meal
  end





  private

  def meal_params
    params.require(:meal).permit(:name,:price)
  end

  def meal_check
    order=Order.find(params[:order_id])
    if order.meals.find_by(params[:user_id]).nil?
    else
      redirect_to root_path
      return false
    end
  end

  def status_check
    order = Order.find(params[:order_id])
    puts order.order_status_id
    unless(order.order_status_id == 4)
      return true
    else
      redirect_to root_url
      return false
    end
  end

end
