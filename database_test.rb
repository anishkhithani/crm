require 'test/unit'

require_relative '..contact'

class TestConact < Test::Unit::TestCase

    def initialize_with_valid_params_works
    contact = Contact.new(5,"Will","Richman","will@bitmakerlabs.com", "notes")
    #assert that the variables passed in are retrievable and therefore stored
    #assert that you get back an instance of a contact
    assert contact.is_a?(Contact)
    assert_equal 5, contact.id
    end

end
