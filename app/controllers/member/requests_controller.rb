class Member::RequestsController < ApplicationController

	before_action :authenticate_member!

	def index
		@requests = current_member.requests.page(params[:page]).per(15)
	end

	def new
		@request = Request.new
		@genres = EventGenre.where(is_active: :true)
	end

	def create
		@request = Request.new(request_params)
		@request.member_id = current_member.id
		@genres = EventGenre.where(is_active: true)
		if @request.save
		   redirect_to requests_path(current_member.id)
		else
		   render :new
		end
	end

	def edit
		@request = Request.find(params[:id])
		@genres = EventGenre.where(is_active: true)
	end

	def update
		@request = Request.find(params[:id])
		@genres = EventGenre.where(is_active: true)
		@request.approval_status = 0
		if @request.update(request_params)
		   redirect_to requests_path(@request)
		else
		   render :edit
		end
	end

	def destroy
		@request = Request.find(params[:id])
		@request.destroy
        redirect_to requests_path
    end

	private

    def request_params
        params.require(:request).permit(:event_genre_id,
      	                                :start_day,
      	                                :finish_day,
                                        :people,
                                        :chief_name,
                                        :help,
                                        :title,
                                        :body,
                                        :approval_status)
    end

end
