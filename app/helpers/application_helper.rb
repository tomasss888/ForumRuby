# frozen_string_literal: true

# uses markdown converts stuff into plain text, uses redcarpet for that
module ApplicationHelper
  require 'redcarpet/render_strip'

  # converts role into plain text
  def has_role?(role)
    current_user&.has_role?(role)
  end

  # ??
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code,language).div
    end
  end

  # markdown converts text to html
  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

  # Same but backwards
  def strip_markdown(text)
    markdown_to_plain_text = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    markdown_to_plain_text.render(text).html_safe
  end
end
