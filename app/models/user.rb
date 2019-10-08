class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :ID_number, :mobile, presence: true, uniqueness: true
  validates :balance, presence: true
end
