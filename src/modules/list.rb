require 'json'

module List
  def list_all_books
    return [] unless File.exist?('./src/modules/books.json')

    book_data = File.read('./src/modules/books.json')
    @books = JSON.parse(book_data)
    @books.each_with_index do |book, index|
      puts "#{index + 1} Title: '#{book['title']}', Author: #{book['author']}"
    end
  end

  def list_all_people
    return [] unless File.exist?('./src/modules/people.json')

    people_data = File.read('./src/modules/people.json')
    @people = JSON.parse(people_data)
    @people.each_with_index do |person, index|
      puts "#{index + 1} Type: '#{person['type']}', Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
  end

  def list_rentals_by_id
    return [] unless File.exist?('./src/modules/rentals.json')

    rental_data = File.read('./src/modules/rentals.json')
    @rentals = JSON.parse(rental_data)
    print "Enter a person's ID: "
    person_id = gets.chomp.to_i

    people_data = File.read('./src/modules/people.json')
    @people = JSON.parse(people_data)
    if !@people.find { |person| person['id'] == person_id }
      puts "No rental found with ID: #{person_id}"
    elsif @rentals.empty?
      puts 'The rental list is empty'
    else
      puts "\nRentals #{@rentals.count}:\n"
      @rentals.each do |rental|
        puts "Date: #{rental['date']}, Book: '#{rental['title']}' by #{rental['author']}, Rented to: #{rental['name']}"
      end
    end
  end
end
