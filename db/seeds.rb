# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying all records"
Borrow.destroy_all
Book.destroy_all
User.destroy_all

puts "Creating Test User"
testUser = User.create(email: "test@user.com", password: "password")
puts "test@user.com created"

2.times do
  book = Book.create(title: Faker::Book.title, author: Faker::Book.author)
  Borrow.create(status: "Borrowed", user: testUser, book: book)
end

2.times do
  puts "Seeding User"
  user = User.create(email: Faker::Internet.email, password: Faker::Internet.password)
  puts "user created"
  
  2.times do
    book = Book.create(title: Faker::Book.title, author: Faker::Book.author)
    Borrow.create(status: "Borrowed", user: user, book: book)
  end
end

10.times do
  Book.create(title: Faker::Book.title, author: Faker::Book.author)
end