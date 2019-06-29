class CategoriesController < ApplicationController
  include MarkdownHelper

  before_action :set_category, only: [:edit, :update, :show, :destroy]
  before_action :set_renderer, only: [:show]
  before_action :get_all_categories

  def new
    @category = Category.new
  end

  def show
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html {redirect_to categories_url(@category.name), notice: 'Category was successfully updated.'}
      else
        format.html {render edit_categories_url(@category.name), errors: @category.errors.full_messages}
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html {redirect_to root_url, notice: 'Post was successfully destroyed.'}
    end
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html {redirect_to categories_url(@category.name, notice: 'Category was successfully created.')}
      else
        format.html {redirect_to new_categories_url(errors: @category.errors.full_messages)}
      end
    end
  end

  private

  def set_category
    @category = Category.where(name: params[:name]).first
  end

  def category_params
    params.require(:category).permit(:name, :homepage)
  end

  def edit
  end

  private

  def get_all_categories
    @categories = Category.all
  end

end
