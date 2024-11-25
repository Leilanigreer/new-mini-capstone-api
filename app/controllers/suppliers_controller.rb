class SuppliersController < ApplicationController
  before_action :authorize_admin!, only: [ :new, :create, :edit, :update, :destroy ]

  def index
    @suppliers = Supplier.all
    render :index
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render :show
  end
end
