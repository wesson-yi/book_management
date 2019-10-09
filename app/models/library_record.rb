class LibraryRecord < ApplicationRecord
  validates :status, :deadline, presence: true
  validates :status, inclusion: { in: ['initial', 'renew', 'returned'] }

  belongs_to :user
  belongs_to :book

  # 价格策略，暂定续借费用不变
  COST_PER_DAY = 0.1

  def total_cost
    (Time.current - created_at) / 60 / 60 / 24 * COST_PER_DAY
  end
end
