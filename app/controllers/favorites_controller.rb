class FavoritesController < ApplicationController
  def create
  	post = Post.find(params[:post_id])
  	favorite = current_user.favorites.new(post_id: post.id)
  	favorite.save
  	redirect_to request.referer
  end

  def destroy
  	post = Post.find(params[:post_id])
  	favorite = current_user.favorites.find_by(post_id: post.id)
  	favorite.destroy
  	redirect_to request.referer
  end

  def likes
    @post = Post.find(params[:post_id])
    @post.favorite_users = @post.favorite_users.where.not(id: current_user.id).distinct
  end

  def liked
    @favorite = current_user.favorite_posts.page(params[:page]).per(20).order("updated_at DESC")
  end
end
