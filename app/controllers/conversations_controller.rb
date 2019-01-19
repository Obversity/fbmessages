class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end
end
