require "./contact.rb"

class Database

  attr_accessor :contacts

  def initialize
    @contacts = []
  end

  def add(id, firstname, lastname, email, notes)
    @contacts << Contact.new(id, firstname, lastname, email, notes)
  end

  def contact_index_helper(attribute)
    index = nil
    @contacts.each_with_index do |contact, idx|
      index = idx if contact.id         == attribute
      index = idx if contact.firstname  == attribute
      index = idx if contact.lastname   == attribute
      index = idx if contact.email      == attribute
      index = idx if contact.notes      == attribute
    end
    index
  end

  def modify_contact(selection, attribute, modification)
    index = contact_index_helper(selection)
    @contacts[index].send(attribute + '=', modification) rescue nil
  end

  def display_all_contacts
    @contacts.each do |contact|
      contact.contact_display
    end
  end

  def display_particular_contact(attribute)
    index = contact_index_helper(attribute)
    @contacts[index].contact_display unless index.nil?
  end

  def display_info_by_attribute(attribute)
    result = []
    @contacts.each do |contact|
      result << contact.id if "id"                == attribute
      result << contact.firstname if "firstname"  == attribute
      result << contact.lastname if "lastname"    == attribute
      result << contact.email if "email"          == attribute
      result << contact.notes if "notes"          == attribute
    end
    result
  end

end

# db = Database.new
# db.add(1000, "Matt", "Emmons", "email!", "notes")
# db.add(1001, "Frank", "B", "wat!", "NO")
# p db.display_info_by_attribute("id")


# db.display_all_contacts
# db.modify_contact(1000, "id", 9999)
# db.display_all_contacts
