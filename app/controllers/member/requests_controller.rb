class Member::RequestsController < ApplicationController

	before_action :authenticate_member!

	def top
		@request = Request.where(approval_status: 1)
	    @requests = @request.all
	end

	def index
		@requests = current_member.requests.includes(:event_genre, :report).page(params[:page]).per(15)
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
		   redirect_to requests_path(current_member.id), notice: "リクエストを送信しました。"
		else
		   render :new
		end
	end

	def edit
		@request = current_member.requests.find(params[:id])
		@genres = EventGenre.where(is_active: true)
	end

	def update
		@request = Request.find(params[:id])
		@request.member_id = current_member.id
		@genres = EventGenre.where(is_active: true)
		@request.approval_status = 0
		if @request.update(request_params)
		   redirect_to requests_path, notice: "リクエストを再送信しました。"
		else
		   render :edit
		end
	end

	def destroy
		@request = Request.find(params[:id])
		@request.destroy
        redirect_to requests_path, notice: "削除しました。"
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
