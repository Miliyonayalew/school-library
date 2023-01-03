require 'json'

module List
  def list_all_books
    return [] unless File.exist?('./src/modules/books.json')

    book_data = File.read('./src/modules/books.json')
    book_list = JSON.parse(book_data)
    book_list.each_with_index do |book, index|
      puts "#{index + 1} Title: '#{book['title']}', Author: #{book['author']}"
    end
  end

  def list_all_people
    return [] unless File.exist?('./src/modules/people.json')

    people_data = File.read('./src/modules/people.json')
    person_list = JSON.parse(people_data)
    person_list.each_with_index do |person, index|
      puts "#{index + 1} Type: '#{person['type']}', Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
  end

  def list_rentals_by_id
    print "Enter a person's ID: "
    person_id = gets.chomp.to_i
    if !@people.find { |person| person.id == person_id }
      puts "No rental found with ID: #{person_id}"
    elsif @rentals.empty?
      puts 'The rental list is empty'
    else
      puts "\nRentals #{@rentals.count}:\n"
      @rentals.select do |rental|
        if rental.person.id == person_id
          puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
        end
      end
    end
  end
end
