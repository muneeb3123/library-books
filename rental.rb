require_relative 'person'
require_relative 'book'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date)
    @date = date
  end

  def add_person(person)
    @person = person
    person.add_rental(self) unless person.rentals.include?(self)
  end

  def add_book(book)
    @book = book
    book.add_rental(self) unless book.rentals.include?(self)
  end
end

# # Create some book objects
# book1 = Book.new('Book 1', 'Author 1')
# book2 = Book.new('Book 2', 'Author 2')

# # Create some person objects
# person1 = Person.new(20, 'Person 1')
# person2 = Person.new(25, 'Person 2')

# # Create rentals linking the books and persons
# rental = Rental.new('2023-07-06')
# rental1 = Rental.new('2023-07-07')
# rental2 = Rental.new('2023-07-08')

# rental.add_book(book1)
# rental1.add_book(book1)
# rental2.add_book(book2)
# rental.add_person(person1)
# rental1.add_person(person2)
# rental2.add_person(person1)

# # Accessing rentals through books
# puts 'Rentals for Book 1:'
# book1.rentals.each do |rentals|
#   puts "Rental Date: #{rentals.date}"
#   puts "Rented by: #{rentals.person.name}"
# end

# puts '--------------------'

# # Accessing rentals through persons
# puts 'Rentals for Person 1:'
# person1.rentals.each do |rentals|
#   puts "Rental Date: #{rentals.date}"
#   puts "Book Title: #{rentals.book.title}"
# end
