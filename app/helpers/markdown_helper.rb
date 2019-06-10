module MarkdownHelper
    def set_renderer
      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end
  end