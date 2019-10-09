class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @records = @book.library_records.includes(:user)
    # @users = @book.users.includes(:library_records)
  end

  def income; end
end
