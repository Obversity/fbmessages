class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :participant
  has_one :person, through: :participant

  scope :photos, ->{ where('content like ?', '%sent a photo.') }
  scope :not_photos, ->{ where.not('content like ?', '%sent a photo.') }
  scope :search, ->(keywords){
    where("content ilike ?", "%#{keywords}%")
  }

  scope :voice_messages, ->{ where('content like ?', "%sent a voice message.") }
  scope :not_voice_messages, ->{ where.not('content like ?', "%sent a voice message.") }

  scope :videos, ->{ where('content like ?', '%sent a video.') }
  scope :not_videos, ->{ where.not('content like ?', '%sent a video.') }

  scope :missed_calls, ->{ where("content like ?", "%missed a call from%") }
  scope :missed_calls, ->{ where("content like ?", "%missed a video chat with%") }
  scope :video_chats, ->{ where('content = ?', "The video chat ended.") }

end
