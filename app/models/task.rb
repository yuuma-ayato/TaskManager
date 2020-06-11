class Task < ApplicationRecord
  enum status: [:未着手, :実行中, :完了]
  validates :content, presence: true, length: { maximum: 50 }
  validates :detail, length: { maximum: 255 }
end
