class StaticPagesController < ApplicationController
  include MarkdownHelper

  before_action :set_renderer, only: [:home, :about]
  before_action :get_categories

  before_action :about, only: [:edit_about, :update_about]
  before_action :home, only: [:edit_home, :update_home]

  def home
    @home = SystemPage.find_by_name("Home")
  end

  def edit_home
  end

  def update_home
    respond_to do |format|
      if @home.update(system_page_params)
        format.html {redirect_to home_url(successes: ['Home page was successfully updated.'])}
      else
        format.html {redirect_to edit_home_url(errors: ['Home page could not be updated'])}
      end
    end
  end

  def about
    @about = SystemPage.find_by_name("About")
  end

  def edit_about
  end

  def update_about
    respond_to do |format|
      if @about.update(system_page_params)
        format.html {redirect_to about_url, notices: ['About page was successfully updated.']}
      else
        format.html {redirect_to edit_about_url(errors: ['About page could not be updated'])}
      end
    end
  end

  def not_found
  end

  private

  def get_categories
    @categories = Category.all
  end

  def system_page_params
    params.require(:system_page).permit(:contents)
  end
end
