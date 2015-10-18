class ArticlesController < ApplicationController
  before_filter :load_articles, only: :index

  def index;  end

  private

  def load_articles
    @articles = Article.all
  end
end
