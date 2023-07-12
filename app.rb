require_relative 'student'
require_relative 'preserved_data'
require_relative 'teacher'
require_relative 'rental'
require_relative 'user_interface'
require 'json'

class App
  include PreservedData

  attr_accessor :books, :persons, :rentals

  def initialize
    @user_interface = UserInterface.new
    @persons = load_person_data_from_file
    @books = load_books_data_from_file
    @rentals = []
    load_rental_data_from_file
  end

  def all_books
    if @books.empty?
      puts '----------------------------------------------------------------------'
      puts 'There are no books found'
      puts '------------------------------------------------------------------------'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
        puts ''
      end
    end
  end

  def all_people
    if @persons.empty?
      puts '----------------------------------------------------------------------'
      puts 'There are no people found'
      puts '------------------------------------------------------------------------'
    else
      @persons.each_with_index do |person, index|
        puts "#{index}) ID: #{person.id}, Age: #{person.age}, Name: #{person.name}"
        puts ''
      end
    end
  end

  def create_student
    print 'Age:  '
    age = @user_interface.user_input
    print 'Name:  '
    name = @user_interface.user_input
    print 'Has parent permission? [Y/N]:  '
    permission = @user_interface.user_input.downcase
    parent_permission = (permission == 'y')
    student = Student.new(name, age, parent_permission: parent_permission)
    @persons << student
    preserved_person_data
    puts '----------------------------------------------------------------------'
    puts 'Person created successfully'
    puts '------------------------------------------------------------------------'
  end

  def create_teacher
    print 'Specialization:  '
    specialization = @user_interface.user_input
    print 'Name:  '
    name = @user_interface.user_input
    print 'Age:  '
    age = @user_interface.user_input
    teacher = Teacher.new(specialization, name, age)
    @persons << teacher
    preserved_person_data
    puts '----------------------------------------------------------------------'
    puts 'Person created successfully'
    puts '------------------------------------------------------------------------'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]:  '
    input = @user_interface.user_input
    if input == '1'
      create_student
    elsif input == '2'
      create_teacher
    else
      puts '----------------------------------------------------------------------'
      puts 'invalid input'
      puts '------------------------------------------------------------------------'
    end
  end

  def create_book
    print 'Title:  '
    title = @user_interface.user_input
    print 'Author:  '
    author = @user_interface.user_input
    book = Book.new(title, author)
    @books << book
    preserved_book_data
    puts '----------------------------------------------------------------------'
    puts 'Book created successfully'
    puts '------------------------------------------------------------------------'
  end

  def create_rental
    puts 'Select a book from the following list by number:  '
    all_books
    input_book = @user_interface.user_input.to_i
    if input_book.negative? || input_book >= @books.length
      puts_invalid_book_selection
      return
    end

    puts 'Select a person from the following list by number (not id):  '
    all_people
    input_person = @user_interface.user_input.to_i

    if input_person.negative? || input_person >= @persons.length
      puts_invalid_person_selection
      return
    end

    create_rental_with_book_and_person(input_book, input_person)
  end

  def all_rentals
    puts 'ID of a person:'
    id = @user_interface.user_input.to_i

    matching_rentals = @rentals.select { |rental| rental.person.id == id }

    if matching_rentals.empty?
      puts '----------------------------------------------------------------------'
      puts 'Rental not found'
      puts '------------------------------------------------------------------------'
    else
      puts 'Rentals:'
      matching_rentals.each do |rental|
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
      puts '----------------------------------------------------------------------'
    end
  end

  private

  def puts_invalid_book_selection
    puts '----------------------------------------------------------------------'
    puts 'Invalid book selection'
    puts '------------------------------------------------------------------------'
  end

  def puts_invalid_person_selection
    puts '----------------------------------------------------------------------'
    puts 'Invalid person selection'
    puts '------------------------------------------------------------------------'
  end

  def create_rental_with_book_and_person(input_book, input_person)
    print 'Date in format YYYY-MM-DD:  '
    date = @user_interface.user_input
    if /^\d{4}-\d{2}-\d{2}$/.match(date)
      rental = Rental.new(date)
      selected_book = @books[input_book]
      selected_person = @persons[input_person]
      rental.add_book(selected_book)
      rental.add_person(selected_person)
      @rentals << rental
      preserved_rental_data
      puts '----------------------------------------------------------------------'
      puts 'Rental created successfully'
      puts '------------------------------------------------------------------------'
    else
      puts '----------------------------------------------------------------------'
      puts 'Invalid date format. Please use the format YYYY-MM-DD.'
    end
  end
end
