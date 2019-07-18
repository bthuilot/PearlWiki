require 'redcarpet/render_strip'
module MarkdownHelper
  def markdown_renderer
    Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end

  def textonly_renderer
    Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    end
  end