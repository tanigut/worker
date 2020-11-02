class Admin::SearchesController < ApplicationController

  def search
      search = params[:search]
      @requests = Request.search(search).page(params[:page]).per(15)
  end

end
