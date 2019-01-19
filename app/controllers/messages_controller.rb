class MessagesController < ApplicationController
  def index
    @conversation = Conversation.find(params[:conversation_id])
    @messages     = @conversation.messages.includes(:person).order(sent_at: :asc).page(params[:page]).per(500)
  end
end
