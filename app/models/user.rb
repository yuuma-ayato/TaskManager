class User < ApplicationRecord
  before_destroy :guarantee_admin_user
  has_many :tasks, dependent: :destroy
  has_secure_password
  before_validation { email.downcase! }
  validates :name, presence:true, length: { maximum: 20 }
  validates :email, presence:true, uniqueness: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ }
  validates :password, presence:true, length: { minimum: 6, maximum: 128 }

  def guarantee_admin_user
    throw(:abort) if User.where(admin:true).count < 2
  end
end
