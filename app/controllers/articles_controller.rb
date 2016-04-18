class ArticlesController < ApplicationController
#  before_action :load_object, except: :index

  def index
    load_collection
  end

  # TODO: show action

  private

  def load_collection
    @articles = ArticlePresenter.present_collection Article.all, view_context
  end

#  def load_object
#    @article = params[:id] ? Article.find(params[:id]) : Article.new
#  end

end
