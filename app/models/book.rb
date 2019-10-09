class Book < ApplicationRecord
  validates :ISBN, :title, :author, :available, :borrowed, presence: true

  has_many :library_records, dependent: :destroy
  has_many :users, through: :library_records

  LEASE_PERIOD = 30

  def lease_period
    Time.current + LEASE_PERIOD.days
  end
end
