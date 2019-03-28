class CategoriesController < ApplicationController
  before_action :set_category, only: ['show']

  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_category
    @post = Category.find(params[:name])
  end

  def category_params
    params.require(:category).permit(:name)
  end


end
