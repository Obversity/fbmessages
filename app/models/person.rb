class Person < ApplicationRecord
  has_many :participants
  has_many :conversations, through: :participants
  has_many :messages, through: :participants
end
