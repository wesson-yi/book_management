# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  title = Faker::Book.title
  isbn = Faker::Number.number(digits: 10)
  author = Faker::Book.author
  description = Faker::Book.genre
  available = 50
  borrowed = 3

  Book.create(ISBN: isbn, title: title, author: author, description: description, available: available, borrowed: borrowed)
end
