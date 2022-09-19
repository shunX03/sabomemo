class Public::RanksController < ApplicationController
  def index
  # 投稿のいいね数ランキング
  @post_like_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').pluck(:post_id))
  end
end
