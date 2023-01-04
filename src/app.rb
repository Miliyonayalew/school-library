require_relative './classes/classroom'
require_relative './classes/student'
require_relative './classes/teacher'
require_relative './classes/book'
require_relative './classes/rental'
require_relative './modules/user_choice'
require_relative './modules/list'
require_relative './modules/person_opp'
require_relative './modules/book_opp'
require_relative './modules/rental_opp'
require 'json'

class App
  attr_reader :books, :people, :rentals

  def load_books
    return [] unless File.exist?('books.json')

    book_data = File.read('books.json')
    book_list = JSON.parse(book_data)
    book_list.each { Book.new('title', 'author') }
  end

  def load_people
    return [] unless File.exist?('people.json')

    people_data = File.read('people.json')
    people_list = JSON.parse(people_data)
    people_list.each do |person|
      case person['type']
      when 'Student'
        Student.new(person['classroom'], person['age'])
      when 'Teacher'
        Teacher.new(person['specialization'], person['age'])
      end
    end
  end

  def load_rentals
    return [] unless File.exist?('rentals.json')

    rental_data = File.read('rentals.json')
    rental_list = JSON.parse(rental_data)
    rental_list.each { Rental.new('date', 'book', 'person') }
  end

  def initialize
    @books = load_books
    @people = load_people
    @rentals = load_rentals
  end

  def run
    prompt_user
  end

  # List Operations
  include List

  # Person Operations
  include PersonOpp

  # Books Operations
  include BookOpp

  # Rentals Operations
  include RentalOpp

  # Exit App
  def quit_app
    puts 'Thank you for using this App! 🙏'
    exit
  end
end
