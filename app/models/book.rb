# == Schema Information
#
# Table name: books
#
#  id                  :bigint           not null, primary key
#  ISBN(国际标准书号)  :string           not null
#  author(作者姓名)    :string           not null
#  available(库存数目) :integer          not null
#  borrowed(外借数目)  :integer          default(0), not null
#  description(简介)   :text
#  title(名称)         :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Book < ApplicationRecord
  validates :ISBN, :title, :author, :available, :borrowed, presence: true
  validates :available, :borrowed, numericality: { greater_than_or_equal_to: 0 }

  has_many :library_records, dependent: :destroy
  has_many :users, through: :library_records

  LEASE_PERIOD = 30

  def lease_period
    Time.current + LEASE_PERIOD.days
  end
end
