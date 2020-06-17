class Task < ApplicationRecord
  include Search
  include Sort
  enum status: %i(未着手 着手中 完了)
  enum priority: %i(低 中 高)
  validates :content, presence: true, length: { maximum: 50 }
  validates :detail, length: { maximum: 255 }
  belongs_to :user
  has_many :task_labels, dependent: :destroy
  has_many :labels, through: :task_labels, source: :label
end
