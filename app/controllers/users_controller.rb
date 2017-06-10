class UsersController < ApplicationController
  def index
    @users = User.all

    render("users/index.html.erb")
  end


  def show
    @user = User.find(params[:id])
    @current_user = current_user

    render("users/show.html.erb")
  end
end
