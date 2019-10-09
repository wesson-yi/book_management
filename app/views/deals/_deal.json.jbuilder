json.extract! deal, :id, :status, :created_at, :finish_at, :deadline, :cost

json.extract! deal.book, :id, :title, :author, :ISBN if local_assigns[:book]
json.extract! deal.user, :name, :gender, :email if local_assigns[:user]
