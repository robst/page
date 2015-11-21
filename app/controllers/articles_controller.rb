class ArticlesController < ApplicationController

  before_action :authentificate!, except: [:index, :show]


  private

  def before_save
    @object.user = current_user
  end
  
  def object_params
    params.require(param_class_name).permit(:title, :content)
  end

end
