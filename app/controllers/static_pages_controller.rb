class StaticPagesController < ApplicationController
  before_action :get_categories
  def home
  end

  def about
  end

  private

  def get_categories
    @categories = Category.all
  end
end
