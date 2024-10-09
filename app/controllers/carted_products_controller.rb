class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.all
  end

  def create
    if current_user != nil
      @carted_product = CartedProduct.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        product_quantity: params[:product_quantity],
        status: "carted",
        order_id: nil
      )
      if @carted_product.save
        render :show
      else
        render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "You must be logged in to place an order" }
    end
  end
end
