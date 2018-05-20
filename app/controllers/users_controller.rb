class UsersController < ApplicationController

  def all_users
  	users = User.all
  	render json: users, status: 200
  end

end