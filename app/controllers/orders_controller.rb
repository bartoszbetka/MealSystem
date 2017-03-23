class OrdersController < ApplicationController
  before_action :confirm_logged_in, only: [:create, :status]

  def index
    order = Order.today
    order_status = OrderStatus.all
    respond_with order
  end

  def active
    order = Order.active
    order_status = OrderStatus.all
    respond_with order
  end

  def history
    order = Order.finalized
    order_status = OrderStatus.all
    respond_with order
  end

  def create
    respond_with Order.create(order_params.merge(user_id: current_user.id))
  end

  def status
    order = Order.find(params[:id])
    order.order_status_id = params[:order_status_id]
    order.save
    respond_with order
  end



  private
  def order_params
    params.require(:order).permit(:restaurantName, :order_status_id)
  end

end
