json.extract! deal, :id, :status, :deadline, :finish_at, :cost, :created_at
json.extract! deal.book, :id, :title if local_assigns[:full]
