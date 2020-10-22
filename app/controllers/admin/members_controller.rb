class Admin::MembersController < ApplicationController

	before_action :authenticate_admin!

	def index
		@members = Member.all
	end

	def edit
		@member = Member.find(params[:id])
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
      params.require(:member).permit(:first_name,
                                     :last_name,
                                     :first_name_kana,
                                     :last_name_kana,
                                     :company_name,
                                     :email,
                                     :is_deleted)
    end
end
