module ApplicationHelper
  def markdown(text)
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    md.render(h(text))
  end

  def coderay snippet
    CodeRay.scan(snippet.code, snippet.language).div(:line_numbers => :inline)
  end

end

class HTMLwithCodeRay < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, language).div(:tab_width=>2)
  end
end