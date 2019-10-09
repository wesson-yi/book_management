class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :name, presence: true, length: { maximum: 50 }
  validates :ID_number, :mobile, presence: true, uniqueness: true
  validates :balance, presence: true

  has_many :library_records, dependent: :destroy
  has_many :books, through: :library_records
end
