class Admin::RequestsController < ApplicationController

	before_action :authenticate_admin!

	def top
		@requests = Request.all
		@request = Request.where(approval_status: 0)
	end

	def index
        @requests = Request.all.page(params[:page]).per(15)
	end

	def edit
        @request = Request.find(params[:id])
	end

	def update
		@request = Request.find(params[:id])
		if @request.update(request_params)
		   redirect_to admin_requests_path(@request), notice: "リクエスト情報を変更しました。"
		else
		　　render :edit
		end
	end

	private

    def request_params
        params.require(:request).permit(:approval_status)
    end

end
