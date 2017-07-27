class SessionsController < ApplicationController

  def new
  end
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = 'Your Username or Password is Invalid'
      redirect_to root_path
    end
  end

  # def edit
  #   current_user
  # end

  def destroy
    session.clear
    redirect_to root_path
  end

end
