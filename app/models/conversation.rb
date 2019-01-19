class Conversation < ApplicationRecord
  has_many :participants
  has_many :messages
end
