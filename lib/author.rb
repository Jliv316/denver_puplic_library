require 'pry'
require "./lib/book"
class Author

    attr_reader :first_name, :last_name, :books

    def initialize(name)
        @first_name = name[:first_name]
        @last_name = name[:last_name]
        @books = []
    end

    def add_book(title, publication_date)
        contents =  {author_first_name: @first_name, 
                     author_last_name: @last_name, 
                     title: title, 
                     publication_date: publication_date}
        new_book = Book.new(contents)
        @books << new_book
    end

end