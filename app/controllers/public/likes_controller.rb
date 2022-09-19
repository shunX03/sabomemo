class Public::LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post = current_user.likes.new(post_id: post.id)
    post.save
    redirect_to request.referer
  end

  def destroy
    post = Post.find(params[:post_id])
    post = current_user.likes.find_by(post_id: post.id)
    post.destroy
    redirect_to request.referer
  end

end
