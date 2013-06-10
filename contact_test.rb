require 'test/unit'

require_relative './contact'

class TestContact < Test::Unit::TestCase

    def setup
        @entry = Contact.new(5,"Will","Richman","will@bitmakerlabs.com", "notes")
    end


    def test_initialize_with_valid_params_works
        #assert that the variables passed in are retrievable and therefore stored
        #assert that you get back an instance of a contact
        # assert(entry.is_a?(Contact))
        assert_equal(5, @entry.id)
        assert_equal("Will", @entry.firstname)
        assert_equal("Richman", @entry.lastname)
        assert_equal("will@bitmakerlabs.com", @entry.email)
        assert_equal("notes", @entry.notes)
    end

    def test_display_all_entries_onscreen
        #think about how to test this function aside from copy+paste
        #an entire block of text...
    end

end
