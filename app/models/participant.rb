class Participant < ApplicationRecord
  belongs_to :person
  belongs_to :conversation
  has_many :messages

  delegate :name, to: :person
end
