class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end

  def income; end
end
