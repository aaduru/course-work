class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    if current_user.nil?
        redirect_to new_user_url
    elsif current_user.id == params[:id].to_i
      redirect_to cats_url
    else
      redirect_to new_user_url
    end

  end

  def new
  end

  def create

    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
