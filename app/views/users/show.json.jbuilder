json.partial! 'user', user: @user, full: true
json.borrow_books @records, partial: 'deals/deal', as: :deal, locals: { full: true }
