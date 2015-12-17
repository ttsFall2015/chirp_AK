class ProfilesController < ApplicationController

  def show
    @users = User.find(params[:id])
    # Creates a show method called users which finds a user
  end

  def index
    @users = User.all
    # Creates an index method called users which applies to all users
end

end
