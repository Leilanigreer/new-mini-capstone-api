class OrdersController < ApplicationController
  def index
    @orders = Order.all
    render :index
  end

  def create
    if current_user != nil
      @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: nil,
        tax: nil,
        total: nil,
      )
      if @order.save
        @order.update(
          subtotal: @order.sub_total,
          tax: @order.order_tax,
          total: @order.order_total
        )
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
