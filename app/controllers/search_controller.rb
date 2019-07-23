class SearchController < ApplicationController
  include SearchHelper

  before_action :get_all_categories

  def search
    @posts = get_search_results
    get_search_page
  end

  private

  def get_all_categories
    @categories = Category.all
  end

  def get_search_results
    if params[:search]
      @search_term = params[:search][:term]
      @search_category_id = /\A\d+\z/.match(params[:search][:category]) ? params[:search][:category].to_i : nil
    end
    Post.search(@search_term, @search_category_id)
  end

  def get_search_page
    @page = params[:page] ? [params[:page].to_i, get_max_page].min : 1
  end
end
