class ProductsController < ApplicationController
  before_action :authenticate_user, only: [ :create, :update, :destroy ]
  before_action :authorize_admin!, only: [ :create, :update, :destroy ]
  before_action :set_product, only: [ :show, :update, :destroy ]

  # Public actions - no auth required
  def index
    @products = Product.all
    render :index
  end

  def show
    render :show
  end

  # Admin-only actions below
  def create
    @product = Product.new(product_params)

    if @product.save
      create_product_images if params[:image_urls].present?
      render :show
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      if params[:image_urls].present?
        # Option 1: Replace all existing images
        @product.images.destroy_all
        create_product_images
      end
      render :show
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    render json: { message: "Product has been removed" }
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
    unless @product
      render json: { error: "Product not found" }, status: :not_found
    end
  end

  def product_params
    {
      name: params[:name] || @product&.name,
      price: params[:price] || @product&.price,
      description: params[:description] || @product&.description,
      supplier_id: params[:supplier_id] || @product&.supplier_id
    }
  end

  def create_product_images
    image_errors = []
    params[:image_urls].each do |url|
      image = @product.images.create(url: url)
      image_errors << image.errors.full_messages if image.errors.any?
    end

    if image_errors.any?
      render json: { image_errors: image_errors.flatten }, status: :unprocessable_entity
    end
  end
end
