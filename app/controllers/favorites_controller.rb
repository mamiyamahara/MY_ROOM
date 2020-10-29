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

  def liked
    @favorite = current_user.favorite_posts.page(params[:page]).per(20).order("updated_at DESC")
  end

  def userliked
    myPosts = current_user.posts
    # 空の配列を作る（@userListで使いたいのでeach do手前で定義しておく）
    userIds = []
    myPosts.each do |myPost|
      # pluck(:id)として、アクティブレコードをidの配列に変える
      # <<で左辺に代入する
      # いいねしてくれるユーザーは複数なので、each doメソッドを使ってループさせる
      userIds<<myPost.favorite_users.pluck(:id)
    end
      # binding pryで見ると、each do手前でuserIds = []を定義したことにより、pluck(:id)と被って[]が二重になってしまっていた。
      # ↑の解決方法として、flattenで二重になっている[]を消す。また、同じ人のidが並ばないように、uniqで重複したidを打ち消す。
    @userList = User.where(id: userIds.flatten.uniq).where.not(id: current_user.id)
  end
end
