require './test/test_helper'
require './lib/author'

class AuthorTest < Minitest::Test
    attr_reader :author

    def setup
        name = {first_name: "Charlotte", last_name: "Bronte"}
        @author = Author.new(name)
    end

    def test_it_exists
        assert_instance_of Author, @author
    end

    def test_author_has_a_name
        assert_equal "Charlotte", author.first_name
        assert_equal "Bronte", author.last_name
    end

    def test_author_defaults_to_no_books
        charlotte_bronte = @author
        assert_equal [], charlotte_bronte.books
    end

    def test_author_add_books
        charlotte_bronte = @author
        assert_equal [], charlotte_bronte.books
        charlotte_bronte.add_book("Villette", "1853")

        refute charlotte_bronte.books.empty?
    end

    
end
