class Participant < ApplicationRecord
  belongs_to :person
  belongs_to :conversation
  has_many :messages, dependent: :delete_all

  delegate :name, to: :person
end
