class MessagesController < ApplicationController

  def create
      @room = Room.find(params[:room_id])
      @message = Message.new(message_params)
      #メッセージがmemberによるものだったらis_member=true, adminによるものだったらis_member=false
      if member_signed_in?
         @message.is_member = true
      elsif admin_signed_in?
         @message.is_member = false
      end
      #メッセージがadminによるものだったらstatus=1
      @message.room_id = @room.id
      if member_signed_in?
        if @message.save
           redirect_to room_path(@room)
        else
           redirect_to room_path(@room)
        end

      elsif admin_signed_in?
           @message.status = 1
        if @message.save
           redirect_to room_path(@room)
        else
           redirect_to room_path(@room)
        end
      end
  end

  private

  def message_params
      params.require(:message).permit(:content)
  end

end
