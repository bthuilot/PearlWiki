class SearchController < ApplicationController

  before_action :get_all_categories
  before_action :get_search_params

  def search
    @posts = Post.search(@search_term, @search_category_id)
  end


  private

  def get_all_categories
    @categories = Category.all
  end

  def get_search_params
    if params[:search]
      @search_term = params[:search][:search_term]
      @search_category_id = /\A\d+\z/.match(params[:search][:search_category]) ? params[:search][:search_category].to_i : nil
    end
  end

end
