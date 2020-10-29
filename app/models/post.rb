class Post < ApplicationRecord

    attachment :post_image, destroy: false
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    has_many :post_comments, dependent: :destroy
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, :body, :post_image, presence: true

    # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる。
    # 存在していればtrue、存在していなければfalseを返す。
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

end
