class Public::MyranksController < ApplicationController
  def index
  # 自分の投稿のいいねランキング
  @my_post_like_ranks = current_user.posts.sort { |a, b| b.likes.count <=> a.likes.count }
  end
end
