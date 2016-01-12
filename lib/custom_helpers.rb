module CustomHelpers

  def foo
    "bar"
  end

  def is_page_active(page)
    current_page.url == page ? 'active' : ''
  end

end
