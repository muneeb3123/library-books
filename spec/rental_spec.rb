require_relative '../rental'

describe Rental do
  let(:rental) { Rental.new('2023-12-12') }
  let(:person) { Person.new }
  let(:book) { Book.new('peace', 'javed') }
  it 'initialize attribute' do
    expect(rental.date).to eql('2023-12-12')
  end

  it 'add rentals to person  ' do
    rental.add_person(person)
    expect(person.rentals).to include(rental)
  end

  it 'add rentals to books' do
    rental.add_book(book)
    expect(book.rentals).to include(rental)
  end

  it 'assign the book' do
    rental.add_book(book)
    expect(rental.book).to eq(book)
  end

  it 'assign the person' do
    rental.add_person(person)
    expect(rental.person).to eq(person)
  end
end
