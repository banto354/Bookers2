class DirectMessagesController < ApplicationController
    def message
        @receiver = User.find(params[:user_id])
        @sender = User.find(current_user.id)
        @message = DirectMessage.new
        @messages = DirectMessage.where(sender_id: @sender.id, receiver_id: @receiver.id)
    end
    
    def create
        @message = DirectMessage.new(message_params)
        @message.sender_id = current_user.id
        @message.receiver_id = params[:user_id]
        @message.save
        redirect_to :message
    end
    
    private
      
    def message_params
        params.require(:direct_message).permit(:comment)
    end
end
