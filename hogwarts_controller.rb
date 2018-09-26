require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/student' )
also_reload( './models/*' )


get '/students' do
  @students = Student.find_all()
  erb(:index)
end

## Q1. Why do I need to gather all my objects of houses before goinf to my
## .erb file?

get '/students/new' do
  @houses = House.find_all()
  erb(:new)
end

## Q2. Does post methods don't need a erb to go to because I'm
## sending the information?


post '/students' do
  @student = Student.new(params)
  @student.save
  redirect '/students'
end
