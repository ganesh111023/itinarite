class ConversationsController < ApplicationController
	before_filter :authenticate_user!
  autocomplete :user, :name, :display_value => :name_capitalize

  layout false, except: [:index]


  def index
    @users = User.get_list_of_user_except_current_user(current_user.id)
  end

  def create
    find_or_create_conversation
    render json: { conversation_id: @conversation.id }
  end

  def show
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages.select{|m| m if m.message_infos.available_message(current_user.id).present? }
    @message = Message.new
  end

  def search_conversation_user
    user = User.find_by_id params[:id]
    params[:sender_id] = current_user.id
    params[:recipient_id] = user.id
    find_or_create_conversation
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def interlocutor(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end

  def find_or_create_conversation
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
  end
end

