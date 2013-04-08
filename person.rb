# class Person 
#   attr_accessor :name
#   attr_accessor :email
#   attr_accessor :hometown
#   attr_accessor :github_user
#   attr_accessor :twitter
#   attr_accessor :fun_fact

#   def questions 

   
#   end
# end

require 'sqlite3'

class Person
  include DataMapper::Resource 
  # attr_accessor :id
  # attr_accessor :type
  # attr_accessor :name
  # attr_accessor :email
  property :id, serial
  property :type, Text, :required => true
  property :name, Text, :required => true
  property :email, Text, :required => true

end