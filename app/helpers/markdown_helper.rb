require 'redcarpet/render_strip'
module MarkdownHelper
    def set_renderer
      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end

    def set_textonly_renderer
      @textonly = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    end
  end