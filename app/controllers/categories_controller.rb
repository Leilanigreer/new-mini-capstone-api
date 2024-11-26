class CategoriesController < ApplicationController
  # before_action :authorize_admin!, only: [ :create, :update, :destroy ]
  # before_action :set_supplier, only: [ :show, :update, :destroy ]

  def index
    @category = Category.all
    render :index
  end

  def show
    @category = Category.find_by(id: params[:id])
    render :show
  end
end
