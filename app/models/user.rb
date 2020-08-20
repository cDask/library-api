class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  has_many :books, through: :borrows
  has_many :borrows, dependent: :destroy
end
