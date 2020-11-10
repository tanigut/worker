class Member::SearchesController < ApplicationController

  def search
	  search = params[:search]
	  @requests = current_member.requests.search(search)
  end

end
