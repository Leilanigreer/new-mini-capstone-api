class CategoriesController < ApplicationController
  before_action :authorize_admin!, only: [ :new, :create, :edit, :update, :destroy ]

  def index
    @category = Category.all
    render :index
  end

  def show
    @category = Category.find_by(id: params[:id])
    render :show
  end
end
