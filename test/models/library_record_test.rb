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

require 'test_helper'

class LibraryRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
