class ArticlesController < ApplicationController

  private
  
  def object_params
    params.require(param_class_name).permit(:title, :content)
  end

end
