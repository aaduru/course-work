class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(session_params[:email],session_params[:password])
    if @user
      log_in(@user)
      flash[:messages] = ["You are logged in"]
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def destroy
    log_out(current_user)
    flash[:messages] = ["see you soon!!!"]
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:email,:password)
  end
end
