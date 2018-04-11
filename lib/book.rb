require 'pry'

class Book
    attr_reader :author_first_name,
                :author_last_name,
                :title,
                :publication_date
    def initialize(contents)
        @author_first_name = contents[:author_first_name]
        @author_last_name = contents[:author_last_name]
        @title = contents[:title]
        @publication_date = contents[:publication_date]
    end


end