class Person
  include DataMapper::Resource 
  property :id, Serial
  property :type, Text, :required => true
  property :name, Text, :required => true
  property :email, Text, :required => true
  property :twitter, Text
  property :github, Text 
end

