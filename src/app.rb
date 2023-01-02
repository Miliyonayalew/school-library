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

  # Exit App
  def quit_app
    puts 'Thank you for using this App! 🙏'
    exit
  end
end
