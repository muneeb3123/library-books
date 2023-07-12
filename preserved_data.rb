require 'json'

module PreservedData
  def preserved_book_data
    json_array = @books.map do |book|
      { title: book.title, author: book.author }
    end
    json = JSON.pretty_generate(json_array)
    File.write('book.json', json)
  end

  def load_books_data_from_file
    if File.exist?('book.json')
      json_data = File.read('book.json')
      if json_data.empty?
        @books = []
      else
        new_books = JSON.parse(json_data).map do |book_data|
          Book.new(book_data['title'], book_data['author'])
        end
        @books = new_books
      end
    else
      @books = []
    end
  end

  def preserved_person_data
    json_array = @persons.map do |person|
      { id: person.id, name: person.name, age: person.age }
    end
    json = JSON.pretty_generate(json_array)
    File.write('person.json', json)
  end

  def load_person_data_from_file
    if File.exist?('person.json')
      json_data = File.read('person.json')
      if json_data.empty?
        @persons = []
      else
        new_persons = JSON.parse(json_data).map do |person_data|
          Person.new(person_data['age'], person_data['name'], id: person_data['id'])
        end
        @persons = new_persons
      end
    else
      @persons = []
    end
  end

  def preserved_rental_data
    json_array = @rentals.map do |rental|
      { date: rental.date, title: rental.book.title, author: rental.book.author, id: rental.person.id }
    end
    json = JSON.pretty_generate(json_array)
    File.write('rental.json', json)
  end

  def load_rental_data_from_file
    return unless File.exist?('rental.json')

    json_data = File.read('rental.json')

    return if json_data.empty?

    new_rentals = JSON.parse(json_data).map do |rental_data|
      book = @books.find { |b| b.title == rental_data['title'] && b.author == rental_data['author'] }
      person = @persons.find { |p| p.id == rental_data['id'] }
      rental_obj = Rental.new(rental_data['date'])
      rental_obj.add_book(book)
      rental_obj.add_person(person)
      rental_obj
    end

    @rentals = new_rentals
  end
end
