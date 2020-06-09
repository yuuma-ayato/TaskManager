class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 50 }
  validates :detail, length: { maximum: 255 }
end
