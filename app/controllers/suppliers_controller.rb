class SuppliersController < ApplicationController
  # before_action :authorize_admin!, only: [ :create, :update, :destroy ]
  # before_action :set_supplier, only: [ :show, :update, :destroy ]

  def index
    @suppliers = Supplier.all
    render :index
  end

  def show
    render :show
  end

  private

  def set_supplier
    @supplier = Supplier.find_by(id: params[:id])
    unless @supplier
      render json: { error: "Supplier not found" }, status: :not_found
    end
  end
end
