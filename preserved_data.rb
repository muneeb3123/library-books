module PreservedData
  require 'json'

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

end
