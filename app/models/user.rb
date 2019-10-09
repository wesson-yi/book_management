# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  ID_number(身份证号码) :string           not null
#  admin(是否为管理员)   :boolean          default(FALSE), not null
#  age(年龄)             :integer
#  balance(余额)         :integer          default(0), not null
#  email(邮箱)           :string
#  gender(性别)          :string
#  mobile(手机号)        :string           not null
#  name(姓名)            :string           not null
#  password_digest(密码) :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :name, presence: true, length: { maximum: 50 }
  validates :ID_number, :mobile, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :age, numericality: { greater_than_or_equal_to: 0 }

  has_many :library_records, dependent: :destroy
  has_many :books, through: :library_records
end
