class PostsController < ApplicationController
  include MarkdownHelper

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_renderer, only: [:show]
  before_action :set_categories

  def show
  end

  def new
    if Category.all.empty?
      redirect_to controller: 'categories', action: 'new', errors: ["No Categories created yet: You must create a category before creating a post"];
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
        format.html {redirect_to "/page/#{@post.id}", notices: ['Post was successfully created.']}
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html {redirect_to @post, notices: ['Post was successfully updated.']}
      else
        format.html {redirect_to edit_post_url(@post, errors: @post.errors.full_messages)}
      end
    end
  end

  def destroy
    category = Category.find(@post.category_id);
    @post.destroy
    respond_to do |format|
      format.html {redirect_to categories_url(category, notices: ['Post was successfully destroyed.'])}
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
