class ArticlesController < ApplicationController

  before_action :authentificate!, except: [:index, :show]
  before_action :load_object, except: :index

  def index
    load_collection
  end

  def new
  end

  def create
    save_object || render_new
  end

  def edit
    render_new
  end  

  def update
    create
  end

  def destroy
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
    render_index if @article.save
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
