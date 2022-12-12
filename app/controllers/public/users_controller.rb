class Public::UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
    @pages = Post.page(params[:page]).per(5).order('created_at DESC')
    @today_post =  @posts.created_today
    @yesterday_post = @posts.created_yesterday
    @this_week_post = @posts.created_this_week
    @last_week_post = @posts.created_last_week
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
