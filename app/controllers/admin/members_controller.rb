class Admin::MembersController < ApplicationController

	before_action :authenticate_admin!

	def index
		@members = Member.all.page(params[:page]).per(15)
	end

	def show
		@member =  Member.find(params[:id])
		@requests = @member.requests
	end

	def update
		@member = Member.find(params[:id])
		if @member.update(member_params)
		   redirect_to admin_members_path
		else
		   render :edit
		end
	end

    private

    def member_params
      params.require(:member).permit(:is_deleted)
    end
end
