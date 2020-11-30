class Admin::SearchesController < ApplicationController

  def search
      search = params[:search]
      @requests = Request.includes(:event_genre).search(search).page(params[:page]).per(15)
  end

end
