module BookOpp
  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book unless @books.include?(book)

    puts "\n Book is successfully created 📚"
  end
end
