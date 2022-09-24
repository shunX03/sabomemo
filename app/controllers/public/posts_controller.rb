class Public::PostsController < ApplicationController

 def new
    @post = Post.new
 end

  def show
    @post = Post.find(params[:id])
    @posts = Post.new
  end

  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.user_id = current_user.id
    @posts = Post.all
    if @post.save
      aaa=[public_completions_path,public_completions2_index_path, public_completions3_index_path, public_completions4_index_path, public_completions5_index_path, public_completions6_index_path]
      redirect_to aaa.sample
    else
      @posts = Post.all
      render :index
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to root_path(@post), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to public_posts_path
  end

  private

  def posts_params
    params.require(:post).permit(:title, :body, :waste, :evaluation)
  end
end
