class CartedProductsController < ApplicationController
  def index
    if current_user != nil
      @carted_products = CartedProduct.carted_items_for_user(current_user)
      @grand_total = CartedProduct.grand_total_for_user_carted(current_user.id)
      render :index
    else
      # @carted_products = CartedProduct.all
      render json: { errors: "You must be logged in to see the items in your cart" }
    end
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
        render json: { errors: @carted_product.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "You must be logged in to place an item in your cart" }
    end
  end

  def update
    @carted_product = CartedProduct.find_by(id: params[:id])

    if @carted_product.nil?
      render json: { error: "carted product not found" }, status: :not_found
    else
      if params[:product_quantity].to_i == 0
        @carted_product.update(status: "removed")
        render json: { message: "Item has been removed" }
      else
        if @carted_product.update(
          product_quantity: params[:product_quantity],
          status: "carted"
          )
          render :show
        else
          render json: { errors:  @carted_product.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end
end
