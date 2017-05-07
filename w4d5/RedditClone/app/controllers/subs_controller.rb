class SubsController < ApplicationController

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end
  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.user_id == current_user.id
      if @sub.update_attributes(sub_params)
        redirect_to sub_url(@sub)
      else
        flash[:errors] = @sub.errors.full_messages
        render :edit
      end
    else
      flash[:errors] = ["You are not the author"]
      render :edit
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title,:description,:user_id)
  end
end
