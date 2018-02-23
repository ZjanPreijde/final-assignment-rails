class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    show_users
  end

  private

  def show_users
    @users = User.all
  end

end
