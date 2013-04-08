require 'sinatra'
#require 'rack-flash'
require 'rubygems'
require 'sqlite3'
require 'data_mapper'
require 'shotgun'
require 'dm-core'
require 'dm-timestamps'
require 'dm-sqlite-adapter'
require 'webrick'
require 'dm-validations'

#db = SQLite3::Database.new("people.db")
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/peeps.db")

#enable :sessions
#use Rack::Flash

# require_relative 'person'
# require_relative 'student'
# require_relative 'instructor'

class Person
  include DataMapper::Resource 
  property :id, Serial
  property :type, Text, :required => true
  property :name, Text, :required => true
  property :email, Text, :required => true

end

DataMapper.finalize.auto_upgrade! 


before '/' do 
  redirect '/login'
end


get '/' do
  @people = Person.all :order => :id.desc
  erb :success
end


post '/login' do
  unless params[:password] == "coolbeans"
   # flash[:notice] = "Sorry, wrong password"
    redirect '/login'
  else erb :index
  end
end

# post '/film' do
 
#   spacefix = params[:film].gsub(" ", "%20")
#   movie = Movie.get_film_info(spacefix)

#   erb :film, :locals => {:film => movie}
# end

get '/login' do
  erb :login
end


get '/student.erb' do
  class Student < Person
  person = Student.new
end
  erb :student#, :locals => {:person => Person}
end

get '/instructor.erb' do
  class Student < Person
  person = Instructor.new
end
  erb :instructor
end

post '/success' do
  person = Person.new
  person.name = params[:name]
  person.email = params[:email]
  person.type = params[:type]
  person.save
  redirect '/'
 # erb :success
end

get '/success' do
    @people = Person.all :order => :id.desc
  end

