class Label < ApplicationRecord
  enum color: { 黒: "#000000", グレー: "#808080", 赤: "#dc143c", 青: "#4169e1",
                緑: "#3cb371", オレンジ: "#ff8c00", 紫: "#ba55d3", 茶色: "#8b4513"}
  validates :label_name, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :color, length: { maximum: 7 }
end
