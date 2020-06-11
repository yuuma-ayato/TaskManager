class Task < ApplicationRecord
  enum status: { "未着手": 0, "進行中": 1, "完了": 2}
  validates :content, presence: true, length: { maximum: 50 }
  validates :detail, length: { maximum: 255 }
end
