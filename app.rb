require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
set :database, {adapter: 'sqlite3', database: "mydb.db"}
require './models/user'
require './models/team'

# #You want to have a route to display a form that allows 
# the user to specify a name from the users table, 

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "mydb.db")

get '/' do
    @users = User.all
    erb :name_form
end

# and posts the result back to another route that will display 
# that user’s attributes along with the team to which they belong.  

post '/show_user' do
    @user = User.find_by(name: params[:name])
    erb :user_attributes
#  params.to_s
end

# get '/user/:id' do
#     @user = User.find(params[:id])
#     if @user.nil?
#         return "User not found"
#     end
#     erb :user
# end

# Create a route get /teams .  That should display a list of teams, and next to each one should be a link that says show, and passes the id of the team on the URL
# 10:54
# Create a route get '/team/:id' .  That should display the team along with  the members


get '/teams' do
    @teams = Team.all
    erb :teams
end

get '/team/:id' do
     @team = Team.find(params[:id])
     if @team.nil?
        return "Team not available"
     end
    erb :team
end

