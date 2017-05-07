class UsersController < ApplicationController
  # def index
  #   # render text: "I'm in the index action!"
  #   @user = User.all
  #   render json: @user
  # end
  #
  # def show
  #   @user = User.find_by(id: params[:id])
  #   render json: @user
  # end
  #
  # def create
  #   user = User.new(params[:user].permit(:name, :email))
  #   if user.save
  #     render json: user
  #   else
  #     render(
  #       json: user.errors.full_messages, status: :unprocessable_entity
  #     )
  #   end
  # end
  #
  # def update
  #   user = User.find_by(id: params[:id])
  #
  #   if user.update(params[:user].permit(:email))
  #     render json: user
  #   else
  #     render(
  #       json: user.errors.full_messages, status: :unprocessable_entity
  #     )
  #   end
  # end
  #
  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   render json: @user
  # end

  def index
    @user = User.all
    render json: @user
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update(user_params)
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end


  private

  def user_params
    params.require(:user).permit(:username)
  end

end
