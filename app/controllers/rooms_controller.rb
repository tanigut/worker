class RoomsController < ApplicationController

  def index
      @room = Room.new
  	  if member_signed_in?
         #@room = member.rooms.build(room_admin_params)
         @new = Message.where(status: 1)
         @count = @new.count
         @admins = Admin.all
         rooms = current_member.rooms
         #自分が入ってるroomの相手のidを格納する
         @admin_ids = []
         rooms.each do |f|
         @admin_ids << f.admin_id
         end

      elsif admin_signed_in?
          #@room = admin.rooms.build(room_member_params)
          @new = Message.where(status: 0)
          @count = @new.count
          @members = Member.all.page(params[:page]).per(15)
          rooms = current_admin.rooms
          #自分が入ってるroomの相手のidを格納する
          @member_ids = []
          rooms.each do |f|
          @member_ids << f.member_id
          end
      end
  end

  def show
  	  @room = Room.find(params[:id])  #ルーム情報の取得
      @message = Message.new          #新規メッセージ投稿
      @messages = @room.messages      #このルームのメッセージを全て取得
      if member_signed_in?
        if @room.member.id == current_member.id
           @admin = @room.admin
           @messages.update(status: "saw")
        else
           redirect_to rooms_path
        end

      elsif admin_signed_in?
        if @room.admin.id == current_admin.id
           @member = @room.member
           @messages.update(status: "saw")
        else
           redirect_to rooms_path
        end

      else
           redirect_to rooms_path
      end
  end

  def create
      binding.pry
      if member_signed_in?
         #memberがログインしてたらmember_idを, adminがログインしてたらadmin_idを@roomにいれる
         @room = Room.new(room_admin_params)
         @room.member_id = current_member.id
      elsif admin_signed_in?
         @room = Room.new(room_member_params)
         @room.admin_id = current_admin.id
      else
         redirect_to rooms_path
      end

      if @room.save
         redirect_to :action => "show", :id => @room.id
      else
         redirect_to rooms_path
      end
  end

  private

  def room_admin_params
      params.require(:room).permit(:admin_id)
  end

  def room_member_params
      params.require(:room).permit(:member_id)
  end

end
