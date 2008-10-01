class MainController < ApplicationController

  def index
    if request.post? and params[:ingredients][:new]
      components = params[:components].size > 0 ? "/#{params[:components].join('/')}" : ""
      redirect_to "#{components}/#{params[:ingredients][:new]}" and return
    end
  end

end
