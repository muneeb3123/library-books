require_relative 'person'
require_relative 'book'

class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person, date)
    @date = date
    @book = book
    @person = person
    book.add_rental(self)
    person.add_rental(self)
  end
end

# Create some book objects
book1 = Book.new('Book 1', 'Author 1')
book2 = Book.new('Book 2', 'Author 2')

# Create some person objects
person1 = Person.new(20, 'Person 1')
person2 = Person.new(25, 'Person 2')

# Create rentals linking the books and persons
Rental.new(book1, person1, '2023-07-06')
Rental.new(book1, person2, '2023-07-07')
Rental.new(book2, person1, '2023-07-08')

# Accessing rentals through books
puts 'Rentals for Book 1:'
book1.rentals.each do |rental|
  puts "Rental Date: #{rental.date}"
  puts "Rented by: #{rental.person.name}"
end

puts '--------------------'

# Accessing rentals through persons
puts 'Rentals for Person 1:'
person1.rentals.each do |rental|
  puts "Rental Date: #{rental.date}"
  puts "Book Title: #{rental.book.title}"
end
