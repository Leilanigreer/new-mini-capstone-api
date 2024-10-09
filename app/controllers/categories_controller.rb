class CategoriesController < ApplicationController
  def index
    @category = Category.all
    render :index
  end

  def show
    @category = Category.find_by(id: params[:id])
    render :show
  end
end
