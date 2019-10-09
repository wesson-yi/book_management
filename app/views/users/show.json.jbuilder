json.partial! 'user', user: @user, full: true
# 借书记录
json.borrow_books @records, partial: 'deals/deal', as: :deal, locals: { book: true }
