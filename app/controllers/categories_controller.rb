class CategoriesController < ApplicationController
  before_action :set_category, only: ['show']
  before_action :get_all_categories

  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to root_url, notice: 'Post was successfully created.' }
      else
        format.html { render 'categories/new' }
      end
    end
  end

  private

  def set_category
    @category = Category.where(name: params[:name]).first
  end

  def category_params
    params.require(:category).permit(:name)
  end

  private

  def get_all_categories
    @categories = Category.all
  end

end
