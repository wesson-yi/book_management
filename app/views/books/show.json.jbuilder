json.partial! 'books/book', book: @book
# 书籍借阅记录
json.libray_records @records, partial: 'deals/deal', as: :deal, locals: { user: true }
