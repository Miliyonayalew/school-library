require_relative './classroom'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './user_choice'
require_relative './modules/list'
require_relative './modules/person_opp'
require_relative './modules/book_opp'
require_relative './modules/rental_opp'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
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

  def quit_app
    puts 'Thank you for using this App! 🙏'
    exit
  end
end
