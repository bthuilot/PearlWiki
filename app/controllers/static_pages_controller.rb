class StaticPagesController < ApplicationController
  include MarkdownHelper

  before_action :set_renderer, only: ['home', 'about']
  before_action :get_categories
  def home
    @home = SystemPage.find_by_name("Home")
  end

  def about
    @about = SystemPage.find_by_name("About")
  end

  def not_found
  end

  private

  def get_categories
    @categories = Category.all
  end
end
