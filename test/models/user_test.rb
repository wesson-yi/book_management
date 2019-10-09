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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
