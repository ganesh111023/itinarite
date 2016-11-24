class MessagesController < ApplicationController
	before_filter :authenticate_user!

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!
    @channel = "/messages/private/#{@conversation.recipient_id}/#{@conversation.sender_id}"
    @channel1 = "/messages/private/#{@conversation.sender_id}/#{@conversation.recipient_id}"
  end

  private

  def message_params
    params.require(:message).permit(:body)
	end
end
