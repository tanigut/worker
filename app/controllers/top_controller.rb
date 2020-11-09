class TopController < ApplicationController

	def index
	end

	def about
	end

	def new_guest
        member = Member.find_or_create_by!(email: 'guest@example.com') do |member|
        member.password = SecureRandom.urlsafe_base64
        member.last_name = "ゲスト"
        member.first_name = "ユーザー"
        member.last_name_kana = "ゲスト"
        member.first_name_kana = "ユーザー"
        member.company_name = "take"
        #member.confirmed_at = Time.now  # Confirmable を使用している場合は必要
        end
        sign_in member
        redirect_to toppage_path, notice: 'ゲストユーザーとしてログインしました。'
    end

end

