class BooksController < ApplicationController
  before_action :set_book

  def show
    @records = @book.library_records.includes(:user)
  end

  def income
    start_at = params[:start_at]
    end_at = params[:end_at]
    total_amount = @book.library_records.returned.finished_between(start_at, end_at).pluck('sum(cost)').first

    render json: { income: total_amount }
  end

  private

  def set_book
    @book = Book.find(params[:id] || params[:book_id])
  end
end
