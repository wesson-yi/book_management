json.extract! user, :id
if local_assigns[:full]
  json.extract! user, :name, :gender, :balance
  # TODO: model 层关联建立后，完善
  json.set! :borrow_books, []
end
