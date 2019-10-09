# == Schema Information
#
# Table name: library_records
#
#  id                      :bigint           not null, primary key
#  cost(此次借阅的花费)    :float
#  deadline(应归还日期)    :datetime         not null
#  finish_at(实际归还日期) :datetime
#  status(借阅所处状态)    :string           default("initial"), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  book_id(书籍 id)        :integer          not null
#  user_id(借阅者 id)      :integer          not null
#
# Indexes
#
#  index_library_records_on_book_id              (book_id)
#  index_library_records_on_user_id              (user_id)
#  index_library_records_on_user_id_and_book_id  (user_id,book_id)
#

class LibraryRecord < ApplicationRecord
  validates :status, :deadline, presence: true
  validates :status, inclusion: { in: ['initial', 'renew', 'returned'] }
  validates :cost, numericality: { greater_than_or_equal_to: 0 }

  after_initialize :set_default_values

  belongs_to :user
  belongs_to :book

  scope :borrowed, -> {
    where.not(status: :returned)
  }
  scope :returned, -> {
    where(status: :returned)
  }

  # 价格策略，暂定续借费用不变
  COST_PER_DAY = 0.1

  def total_cost
    (Time.current - created_at) / 60 / 60 / 24 * COST_PER_DAY
  end

  def self.finished_between(start_at, end_at)
    where('finish_at >= ? and finish_at < ?', start_at, end_at)
  end

  private

  def set_default_values
    status.nil? && self.status = :initial
    cost.nil? && self.cost = 0
  end
end
