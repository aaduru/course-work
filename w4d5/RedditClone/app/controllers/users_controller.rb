class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      #profile password_digest
      redirect_to user_url(@user)
    else
      flash[:errors]= @user.errors.full_messages
      render :new
    end
  end

  def show
    # if current_user.nil?
    #   redirect_to new_user_url
    # els
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      render :show
    else
      redirect_to new_user_url
    end
  end
  private
  def user_params
    params.require(:user).permit(:username,:password)
  end
end
