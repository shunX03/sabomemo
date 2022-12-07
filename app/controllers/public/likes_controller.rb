class Public::LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post = current_user.likes.new(post_id: post.id)
    post.save
  end

  def destroy
    post = Post.find(params[:post_id])
    post = current_user.likes.find_by(post_id: post.id)
    post.destroy
  end

  def post_params
   @post = Post.find(params[:id])
  end
end
