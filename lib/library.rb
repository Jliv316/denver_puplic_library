require './lib/library'
require './lib/author'
require 'pry'

class Library
    attr_reader :books

    def initialize
        @books = []
    end

    def add_to_collection(book_in_array)
        book = book_in_array[0]
        @books << book unless @books.include?(book.title)
   
    end

    def includee?(title)
        found = []
         @books.find do |book|
            if book.title == title
                found << book
            end
        end
        if !found.empty?
            return true
        else
            false
        end
    end


end