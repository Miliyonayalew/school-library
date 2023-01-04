require 'json'

module RentalOpp
  def persist_rental(date, person_index, book_index)
    new_rental = { 'date' => date, 'author' => @books[book_index]['author'], 'title' => @books[book_index]['title'],
                   'name' => @people[person_index]['name'], 'id' => @people[person_index]['id'] }
    rental_data = File.read('rentals.json')
    @rentals = JSON.parse(rental_data)
    @rentals << new_rental
    File.write('rentals.json', JSON.pretty_generate(@rentals))
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

    rental = Rental.new(date, @people[person_index], @books[book_index])
    @rentals << rental unless @rentals.include?(rental)
    persist_rental(date, person_index, book_index)

    puts "\nRental created successfully 👍 \n\n"
  end
end
