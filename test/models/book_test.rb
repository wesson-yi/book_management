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

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
