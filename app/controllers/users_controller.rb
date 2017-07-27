class UsersController < ApplicationController
  def new
    @new_user = User.new
  end

  def show
    # binding.pry
    current_user
    authorize_user
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if !@user.save
      redirect_to new_user_path
    else
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :admin, :password)
  end

end
