class MessagesController < ApplicationController
	before_filter :authenticate_user!
  before_filter :find_conversation

  def create
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    if @message.save
      @message.message_infos.create(user_id: @conversation.sender_id , status: "available")
      @message.message_infos.create(user_id: @conversation.recipient_id , status: "available")
    end
    @channel = "/messages/private/#{@conversation.recipient_id}/#{@conversation.sender_id}"
    @channel1 = "/messages/private/#{@conversation.sender_id}/#{@conversation.recipient_id}"
  end

  def destroy
    message = @conversation.messages.find_by_id params[:id]
    message_info = message.message_infos.find_by_user_id(current_user.id)
    message_info.update_column(:status,'deleted')
  end

  private

  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body)
	end
end
