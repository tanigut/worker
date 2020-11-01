class Admin::ReportsController < ApplicationController

	before_action :authenticate_admin!

	def show
		@request = Request.find(params[:request_id])
		@report = @request.report
	end

end
