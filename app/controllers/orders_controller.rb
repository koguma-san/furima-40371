class OrdersController < ApplicationController

  def index
  end

  def create
    @order_address = OrderAddress.new(order_params)
  end
end