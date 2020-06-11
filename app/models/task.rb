class Task < ApplicationRecord
  enum status: [:waiting, :working, :complete]
  validates :content, presence: true, length: { maximum: 50 }
  validates :detail, length: { maximum: 255 }
end
