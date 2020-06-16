class Label < ApplicationRecord
  validates :label_name, precense: true, uniqueness: true
  validates :color, length: { maximum: 7 }
end
