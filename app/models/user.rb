class User < ApplicationRecord
  has_many :tasks
  validates :name, presence:true, length: { maximum: 20 }
  validates :email, presence:true, uniqueness: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ }
end
