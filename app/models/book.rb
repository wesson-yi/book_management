class Book < ApplicationRecord
  validates :ISBN, :title, :author, :available, :borrowed, presence: true
end
