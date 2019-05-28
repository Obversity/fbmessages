class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :participant
  has_one :person, through: :participant

  scope :photos, ->{ where('content like ?', '%sent a photo.') }
  scope :not_photos, ->{ where.not('content like ?', '%sent a photo.') }
  scope :search, ->(keywords){
    where("content ilike ?", "%#{keywords}%")
  }

  scope :missed_calls, ->{ where("content like ?", "%missed a call from%") }
  scope :missed_calls, ->{ where("content like ?", "%missed a video chat with%") }
  scope :video_chats, ->{ where('content = ?', "The video chat ended.") }
end
