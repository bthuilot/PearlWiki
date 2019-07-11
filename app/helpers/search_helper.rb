module SearchHelper
  def get_text_preview post
    @textonly.render(post.contents[0...TEXT_LENGTH]).concat(post.contents.length > TEXT_LENGTH ? '...' : '')
  end

  private

  TEXT_LENGTH = 30
end
