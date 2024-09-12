class OrdersController < ApplicationController
  def index
    @orders = Order.all
    render :index
  end

  def create
    pp "This IS THE CURRENT USER"
    pp current_user
    pp "THAT WAS THE CURRENT"
    if current_user != nil
      @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: params[:subtotal],
        tax: params[:tax],
        total: params[:total],
      )
      if @order.save
        render :show
      else
        render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "You must be logged in to place an order" }
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end
end
