module SearchHelper
  include MarkdownHelper

  RESULTS_PER_PAGE = 20

  def get_text_preview post
    contents = post.contents || ""
    textonly_renderer.render(contents || "")[0...TEXT_LENGTH].concat(contents.length > TEXT_LENGTH ? '...' : '')
  end

  def get_max_page
    max_page = (@posts.length / RESULTS_PER_PAGE)
    @posts.length % RESULTS_PER_PAGE > 0 ? max_page + 1 : max_page
  end

  def has_left_arrow
    @page > 1 and @page > 0
  end

  def has_right_arrow
    @page < get_max_page and @page > 0
  end

  def get_lower_page
    start = @page < 1 ? 1 : @page
    [start - 4, 1].max
  end

  def get_higher_page
    start = @page < 1 ? 1 : @page
    [start + 4, get_max_page].min
  end

  def get_paginated_results
    if @page > 0
      start_result = (@page - 1) * RESULTS_PER_PAGE
      @posts[start_result...start_result + RESULTS_PER_PAGE]
    else
      @posts
    end
  end

  private

  TEXT_LENGTH = 30
end
