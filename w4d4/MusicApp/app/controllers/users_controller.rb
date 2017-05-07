class UsersController < ApplicationController

  def show
  
    if !current_user || current_user.id != params[:id].to_i
      redirect_to new_user_url
    else
      @user = current_user
      render :show
    end
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      log_in(@user)
      redirect_to user_url(@user)
    else
      flash[:messages] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,:password)
  end
end
