json.extract! user, :id
json.extract! user, :name, :gender, :balance if local_assigns[:full]
