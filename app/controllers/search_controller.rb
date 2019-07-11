class SearchController < ApplicationController
  include MarkdownHelper

  before_action :get_all_categories
  before_action :get_search_params
  before_action :set_textonly_renderer

  def search
    @posts = Post.search(@search_term, @search_category_id)
    @posts_length = @posts.length
    @max_page = (@posts_length / RESULTS_PER_PAGE) + 1
    if @page > 1
      start_result = (@page - 1) * RESULTS_PER_PAGE
      @posts = @posts[start_result...start_result + RESULTS_PER_PAGE]
    end
  end


  private

  RESULTS_PER_PAGE = 20

  def get_all_categories
    @categories = Category.all
  end

  def get_search_params
    if params[:search]
      @search_term = params[:search][:search_term]
      @search_category_id = /\A\d+\z/.match(params[:search][:search_category]) ? params[:search][:search_category].to_i : nil
      @page = params[:page].to_i || 1
    end
  end
end
