require_relative '../book'

describe Book do
  it 'should initialize with title, author, and rentals' do
    book = Book.new('Jungle Book', 'Muneeb')
    expect(book).to have_attributes(title: 'Jungle Book', author: 'Muneeb', rentals: [])
  end

  it 'should store data in rentals array and pass itself to add_book method' do
    rental = double('rental')
    allow(rental).to receive(:add_book)
    book = Book.new('Jungle Book', 'Muneeb')

    book.add_rental(rental)

    expect(book.rentals).to include(rental)
    expect(rental).to have_received(:add_book).with(book)
  end
end
