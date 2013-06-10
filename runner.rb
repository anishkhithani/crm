require "./database.rb"

db = Database.new
id = 1000

def gap
  puts ""
  puts "------------------------------------------------------------------"
  puts "------------------------------------------------------------------"
  puts ""
end

puts ""
puts "Welcome to Ruby CRM App 4000"

loop do
  gap
  puts "type 'add' to add a contact"
  puts "type 'display all' to display all contacts"
  puts "type 'display contact' to display a particular contact"
  puts "type 'display attribute' to display all contacts specific attribute"
  puts "type 'modify' to edit a contacts information"
  puts "type 'delete' to remove a contact"
  puts "type 'exit' to quit!"
  gap
  input = gets.chomp

  case input
  when "add"
    puts "Please enter a first name"
    firstname = gets.chomp
    puts "please enter a last name"
    lastname = gets.chomp
    puts "please enter an email"
    email = gets.chomp
    puts "please enter notes"
    notes = gets.chomp

    db.add(id, firstname, lastname, email, notes)
    id += 1


  when "modify"
    db.display_all_contacts
    puts "Please enter information for the user you wish to modify:"
    user_id = gets.chomp
    puts "Enter the attribute you wish to modify:"
    user_attribute = gets.chomp
    puts "You selected #{user_attribute} to modify, are you sure ('yes' to confirm):"
    user_confirm = gets.chomp

    if user_confirm.downcase == 'yes'
      puts "Enter the updated value"
      user_modification = gets.chomp
      db.modify_contact(user_id, user_attribute, user_modification)
      db.display_all_contacts
    end

  when "display all"
    puts ""
    db.display_all_contacts
    puts ""

  when "display contact"
    db.display_all_contacts
    puts "Enter a user id to display"
    user_id = gets.chomp.to_i
    puts db.display_particular_contact(user_id)

  when "display attribute"
    puts "Please enter an attribute to view"
    user_attribute = gets.chomp
    puts db.display_info_by_attribute(user_attribute)

  when "delete"
    db.display_all_contacts
    puts "Please enter a user id number to delete that contact"
    user_id = gets.chomp.to_i
    puts "Are you sure you want to delete this entry?"
    user_confirm = gets.chomp
    if user_confirm.downcase == 'yes'
      db.delete_contact(user_id)
      db.display_all_contacts
    end

  when "exit"
    break
  end
end
