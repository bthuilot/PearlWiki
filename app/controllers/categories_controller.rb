class CategoriesController < ApplicationController
  include MarkdownHelper

  before_action :set_category, only: ['show']
  before_action :set_renderer, only: ['show']
  before_action :get_all_categories

  def new
    @category = Category.new
  end

  def show
    @category = Category.find_by_name(params[:name]);
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to root_url, notice: 'Category was successfully created.'}
      else
        format.html {redirect_to controller: 'categories', action: 'new', errors: @category.errors.full_messages}
      end
    end
  end

  private

  def set_category
    @category = Category.where(name: params[:name]).first
  end

  def category_params
    params.require(:category).permit(:name, :title)
  end

  private

  def get_all_categories
    @categories = Category.all
  end

end
