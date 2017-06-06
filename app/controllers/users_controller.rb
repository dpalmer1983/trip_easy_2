class UsersController < ApplicationController
  def index
    @users = User.all

    render("devise/registrations/new.html.erb")
  end


  def new
    @users = User.new
    @username = Username.new

    render("devise/registrations/new.html.erb")
  end
end
