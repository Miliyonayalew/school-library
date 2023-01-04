require 'json'

module RentalOpp
  def persist_rental(date, person_index, book_index)
    new_rental = { 'date' => date, 'author' => @books[book_index]['author'], 'title' => @books[book_index]['title'],
                   'name' => @people[person_index]['name'] }
    rental_data = File.read('./src/modules/rentals.json')
    rental_list = JSON.parse(rental_data)
    rental_list << new_rental
    File.write('./src/modules/rentals.json', JSON.pretty_generate(rental_list))
  end

  def create_rental
    print "Select a book from the following list by number:\n"
    list_all_books
    prompt_user if @books.empty?
    book_index = gets.chomp.to_i - 1

    print "Select a person from the following list by number:\n"
    list_all_people
    prompt_user if @people.empty?
    person_index = gets.chomp.to_i - 1

    print 'Date [yyyy-mm-dd]: '
    date = gets.chomp

    persist_rental(date, person_index, book_index)

    puts "\nRental created successfully 👍 \n\n"
  end
end
