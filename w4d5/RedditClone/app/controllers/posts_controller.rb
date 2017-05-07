class PostsController < ApplicationController
  before_action :correct_user_id, only: [:update, :destroy, :edit]

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to sub_url(@post.sub_id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :user_id, :sub_id, :content, sub_ids: [])
  end

  def correct_user_id
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      flash[:errors] = ["You are not the author"]
      render :edit
    end
  end

end
