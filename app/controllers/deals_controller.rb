class DealsController < ApplicationController
  before_action :set_user, :set_book, only: [:borrow, :return]

  def borrow
    # TODO: validate
    # 借阅一本对应一条记录
    record_params = { book: @book, status: :initial, deadline: @book.lease_period }
    @user.library_records.create!(record_params)
    render plain: nil, status: :created
  end

  def return
    # TODO: validate
    record = @user.library_records.find_by(book: @book)
    record.update!(status: :returned, finish_at: Time.current, cost: record.total_cost)
    @user.balance -= record.total_cost
    @user.save!
    render plain: nil, status: :created
  end

  private

  def set_user
    @user ||= User.find(params.require(:deal)[:user_id])
  end

  def set_book
    @book ||= Book.find(params.require(:deal)[:book_id])
  end
end
