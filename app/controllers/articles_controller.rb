class ArticlesController < ApplicationController

  before_action :authentificate!, except: [:index, :show]

  def index
    load_collection
  end

  def new
    load_object
  end

  def create
    load_object
    if save_object
      render_index
    else
      render_new
    end
  end

  def edit
    load_object
    render_new
  end  

  def update
    load_object
    if save_object
      render_index
    else
      render_new
    end
  end

  def destroy
    load_object
    @article.destroy
    render_index
  end

  private

  def load_collection
    @articles = ArticlePresenter.present_collection Article.all, view_context
  end

  def load_object
    @article = params[:id] ? Article.find(params[:id]) : Article.new
  end

  def save_object
    @article.attributes = article_params
    @article.user ||= current_user
    @article.save
  end

  def render_new
    render :new
  end

  def render_index
    redirect_to :articles
  end
  
  def article_params
    params.require(:article).permit(:title, :content)
  end

end
