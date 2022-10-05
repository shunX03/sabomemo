class Public::PostsController < ApplicationController
before_action :ensure_correct_user, only: [:edit]
 def new
    @post = Post.new
 end

  def show
    @post = Post.find(params[:id])
    @posts = Post.new
  end

  def index
    @post = Post.new
    @posts = Post.all
    @pages = Post.page(params[:page]).per(10).order('created_at DESC')
  end

  def create
    @post = Post.new(posts_params)
    @post.user_id = current_user.id
    @posts = Post.all

    @post.score = Language.get_data(posts_params[:body])
    if @post.save
      aaa=[public_completions_path,public_completions2_index_path, public_completions3_index_path, public_completions4_index_path, public_completions5_index_path, public_completions6_index_path]
      redirect_to aaa.sample
    else
      @pages = Post.page(params[:page]).per(10).order('created_at DESC')
      render :index
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to public_user_path(current_user)
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
    redirect_to public_posts_path unless @user == current_user
  end
end

