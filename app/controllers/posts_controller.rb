class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @user = current_user
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    @comments = @post.comments
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    new_post = Post.new(post_params)
    new_post.likes_counter = 0
    new_post.comments_counter = 0
    new_post.update_posts_counter
    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to user_posts_path(@user), notice: 'Success!'
        else
          render :new, alert: 'Error occured!'
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = User.find(params[:user_id])
    user.posts_counter -= 1
    post.destroy
    user.save
    flash[:success] = 'You have deleted this post!'
    redirect_to user_path(current_user.id)
  end

  private

  def post_params
    post_hash = params.require(:post).permit(:title, :text)
    post_hash[:author] = current_user
    post_hash
  end
end
