class ArticlePresenter < BasePresenter

  def self.present_collection collection, view
    collection.collect{ |object| ArticlePresenter.new(object, view) }
  end

  def tagged
    self.tags.join(', ')
  end

end