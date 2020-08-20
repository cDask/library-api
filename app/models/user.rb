class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  has_many :borrows, dependent: :destroy
  has_many :books, through: :borrows
end
