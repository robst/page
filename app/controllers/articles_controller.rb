class ArticlesController < ApplicationController
  
  def index
    load_articles
  end
  private

  def load_articles
    @articles = Article.all
  end
end
