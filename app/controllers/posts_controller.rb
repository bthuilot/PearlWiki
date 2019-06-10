class PostsController < ApplicationController
  include MarkdownHelper

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_renderer, only: [:show]
  before_action :set_categories

  def show
  end

  def new
    if Category.all.empty?
      redirect_to '/categories/new', error: 'No Categories created yet'
    else
      @post = Post.new
    end
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to "/page/#{@post.id}", notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html {redirect_to @post, notice: 'Post was successfully updated.'}
      else
        format.html {render :edit, error: 'Post could not be updated'}
      end
    end
  end

  def destroy
    category = Category.find(@post.category_id);
    @post.destroy
    respond_to do |format|
      format.html {redirect_to "/categories/#{category.name}", notice: 'Post was successfully destroyed.'}
    end
  end

  private

  def set_categories
    @categories = Category.all
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:contents, :title, :updated, :created, :category_id)
  end
end
