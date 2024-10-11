class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
    render :index
  end

  def create
    if current_user
      carted_products = CartedProduct.carted_items_for_user(current_user.id)

      if carted_products.any?
        @order = current_user.orders.new

        if @order.save
          carted_products.each do |cp|
          cp.update(status: "purchased", order_id: @order.id, purchased_price: cp.product.price)
          end
          render :show
        else
          render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { errors: [ "No items in cart" ] }, status: :unprocessable_entity
      end
    else
      render json: { errors: [ "You must be logged in to place an order" ] }, status: :unauthorized
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    if @order.user_id == current_user.id
      render :show
    else
      render json: {}, status: :unauthorized
    end
  end
end
