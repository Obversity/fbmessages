class Conversation < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :messages
end
