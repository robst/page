class ArticlePresenter < BasePresenter

  def self.present_collection collection, view
    collection.collect{ |object| ArticlePresenter.new(object, view, excerpt: true) }
  end

  def display_content
    return stripped_content if options[:excerpt]
    content
  end

  def stripped_content
    return "#{content[0..200]} [...]" if content.length > 200
    content[0..200]
  end

  def tagged
    self.tags.join(', ')
  end

end