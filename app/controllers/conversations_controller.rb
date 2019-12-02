class ConversationsController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
		@conversations = Conversation.all
	end
	
	def create
		if Conversation.between(params[:send_id], params[:recipient_id]).present
			@Conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first	
		else
			@conversations = Conversation.create!(conversation_params)
		end
		redirect_to conversation_messages_path(@conversation)
	end

	private def conversation_params
		params.permit(:sender_id, :recipient_id)
	end
end
