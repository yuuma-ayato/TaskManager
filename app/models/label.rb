class Label < ApplicationRecord
  validates :label_name, presence: true, uniqueness: true
  validates :color, length: { maximum: 7 }
end
