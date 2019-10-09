class DealsController < ApplicationController
  before_action :set_user, :set_book, only: [:borrow, :return]

  def borrow
    # 借阅一本对应一条记录
    # TODO refactor it with pundit
    return render json: { code: 'borrow_failed', message: '借书失败' }, status: :service_unavailable unless borrow?(@user, @book)

    record_params = { book: @book, deadline: @book.lease_period }
    @user.library_records.create!(record_params)

    render plain: nil, status: :created
  end

  def return
    record = @user.library_records.borrowed.find_by(book: @book)
    return render json: { code: 'available_return', message: '没有需要归还的书籍' } if record.blank?

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

  def borrow?(user, book)
    user.balance > 0 && book.available > 0
  end
end
