require './test/test_helper'
require './lib/library'

class LibraryTest < Minitest::Test
    attr_reader :dpl

    def setup
        @dpl = Library.new
    end

    def test_it_exists
        assert_instance_of Library, @dpl
    end

    def test_it_has_books
        charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
        jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
        villette  = charlotte_bronte.add_book("Villette", "1853")

        harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
        mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

        dpl = Library.new

        assert_equal [], dpl.books

        dpl.add_to_collection(jane_eyre)

        refute dpl.books.empty?

        dpl.add_to_collection(mockingbird)
        dpl.add_to_collection(villette)
        assert_equal 3, dpl.books.length
    end

    def test_it_can_find_if_library_has_a_specific_book
        charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

        jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
        villette  = charlotte_bronte.add_book("Villette", "1853")

        harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
        mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

        dpl = Library.new

        dpl.add_to_collection(jane_eyre)
        dpl.add_to_collection(mockingbird)
        dpl.add_to_collection(villette)

        assert_equal 3, dpl.books.length

        assert_equal true, dpl.includee?("To Kill a Mockingbird")
        assert_equal false, dpl.includee?("A Connecticut Yankee in King Arthur's Court")
    end
end