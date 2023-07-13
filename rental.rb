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
