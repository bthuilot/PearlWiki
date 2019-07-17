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
        format.html {redirect_to categories_url(@category, successes: ['Category was successfully updated.'])}
      else
        format.html {redirect_to edit_categories_url(@category, errors: @category.errors.full_messages)}
      end
    end
  end

  def destroy
    @category.posts.each do |post|
      post.destroy
    end

    @category.destroy
    respond_to do |format|
     format.html {redirect_to root_url(successes: ['Post was successfully destroyed.'])}
    end
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html {redirect_to categories_url(@category, successes: ['Category was successfully created.'])}
      else
        format.html {redirect_to new_categories_url(errors: @category.errors.full_messages)}
      end
    end
  end

  def edit
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :homepage)
  end

  def get_all_categories
    @categories = Category.all
  end

end
