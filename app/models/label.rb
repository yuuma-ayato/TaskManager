class Label < ApplicationRecord
  enum color: { black: "#000000", gray: "#808080", red: "#dc143c", blue: "#4169e1",
                green: "#3cb371", orange: "#ff8c00", purple: "#ba55d3", brown: "#8b4513"}
  validates :label_name, presence: true, uniqueness: true
  validates :color, length: { maximum: 7 }
end
