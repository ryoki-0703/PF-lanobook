class HomesController < ApplicationController
  def top
    @lanobes = Lanobe.page(params[:page]).reverse_order.limit(10) #投稿を新着順に表示
    @favorite_ranks = Lanobe.find(Favorite.group(:lanobe_id).order('count(lanobe_id) desc').limit(6).pluck(:lanobe_id)) #いいねのランキング
    @comment_ranks = Lanobe.find(PostComment.group(:lanobe_id).order('count(lanobe_id) desc').limit(6).pluck(:lanobe_id)) #コメントランキング
  end
end
