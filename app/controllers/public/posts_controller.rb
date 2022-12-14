class Public::PostsController < ApplicationController
before_action :ensure_correct_user, only: [:edit, :update, :destroy]
 def new
    @post = Post.new
 end

 def index
    @post = Post.new
    @pages = Post.page(params[:page]).per(5).order('created_at DESC')
 end

 def create
    @post = Post.new(posts_params)
    @post.user_id = current_user.id
    @posts = Post.all
    @post.score = Language.get_data(posts_params[:body])
  if @post.save
      result=[completions_path, completions2_index_path, completions3_index_path, completions4_index_path, completions5_index_path, completions6_index_path]
      redirect_to result.sample
  else
      @pages = Post.page(params[:page]).per(5).order('created_at DESC')
      render :new
  end
 end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to request.referer
  end

  private

  def posts_params
    params.require(:post).permit(:title, :body, :waste, :evaluation)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    @user = @post.user
    redirect_to posts_path unless @user == current_user
  end
end

