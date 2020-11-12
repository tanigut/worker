class Member::MembersController < ApplicationController

	before_action :authenticate_member!

	def show
		@member = current_member
		@requests = @member.requests
		@members = @member.requests.where(approval_status: 3)
		#@members = @member.eager_load(:requests).where("messages.status = '3'")
		#@requests = @member.eager_load(:requests)
	end

	def edit
		@member = current_member
	end

	def update
		@member = current_member
		if @member.update(member_params)
		   redirect_to member_path, notice: "会員情報を更新しました。"
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
                                     :email)
    end

end
