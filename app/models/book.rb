class Book < ApplicationRecord
  has_many :borrows, dependent: :destroy
  has_many :books, through: :borrows
  validates :title, presence: true
end
