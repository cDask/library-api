class Book < ApplicationRecord
  has_many :borrows, dependent: :destroy
  validates :title, presence: true
end
