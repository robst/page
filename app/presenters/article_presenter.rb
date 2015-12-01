class ArticlePresenter < BasePresenter

  def display_content
    return stripped_content if options[:excerpt]
    content
  end

  def stripped_content
    return "#{content[0..200]} [...]" if content.length > 200
    content[0..200]
  end

  def tagged
    self.tags_plucked_names.join(', ')
  end

end