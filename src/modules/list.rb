require 'json'

module List
  def list_all_books
    if @books.empty?
      puts 'The book list is empty, chose 4 to create book'
    else
      puts @books.count <= 1 ? "\n#{@books.count} Book\n" : "\n#{@books.count} Book's \n"
      @books.each_with_index do |book, index|
        puts "#{index + 1} Title: '#{book['title']}', Author: #{book['author']}"
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'The people list is empty, chose 3 to add people'
    else
      puts @people.count <= 1 ? "\n#{@people.count} Person\n" : "\n#{@people.count} Person's \n"
      @people.each_with_index do |person, index|
        puts "#{index + 1} [#{person['type']}] Name: #{person['name']}, ID: #{person['id']} Age: #{person['age']}"
      end
    end
  end

  def list_rentals_by_id
    print "Enter a person's ID: "
    person_id = gets.chomp.to_i
    if !@people.find { |person| person['id'] == person_id }
      puts "No rental found with ID: #{person_id}"
    elsif @rentals.empty?
      puts 'The rental list is empty'
    else
      puts "\nRentals #{@rentals.count}:\n"
      @rentals.each do |rental|
        puts "Date: #{rental['date']}, Book: '#{rental['title']}' by #{rental['author']}" if rental['id'] == person_id
      end
    end
  end
end
