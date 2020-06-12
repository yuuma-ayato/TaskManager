class Task < ApplicationRecord
  include Search
  include Sort
  enum status: [:未着手, :着手中, :完了]
  validates :content, presence: true, length: { maximum: 50 }
  validates :detail, length: { maximum: 255 }
end
