class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :participant
  has_one :person, through: :participant
end
