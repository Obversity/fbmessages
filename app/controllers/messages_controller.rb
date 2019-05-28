class MessagesController < ApplicationController
  def index
    @conversation = Conversation.find(params[:conversation_id])
    @messages     = @conversation.messages.includes(:person).order(sent_at: :asc)
    @messages     = @messages.where('content ilike ?', "%#{params[:query]}%") if params[:query] && params[:to_record].blank?
    page = 1
    if (params[:page])
      page = params[:page]
    elsif (params[:to_record])
      index = @messages.pluck(:id).index(params[:to_record].to_i)
      page = index/500 + 1
    end
    @messages = @messages.page(page).per(500)
  end

  def stats
    @conversation = Conversation.find(params[:conversation_id])
  end
end
