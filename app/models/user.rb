class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# :database_authenticatable（パスワードの正確性を検証）
# :registerable（ユーザ登録や編集、削除）
# :recoverable（パスワードをリセット）
# :rememberable（ログイン情報を保存）
# :validatable（emailのフォーマットなどのバリデーション）

  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  attachment :profile_image, destroy: false

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, presence: true, length: { maximum: 20 }
  validates :introduction, length: { maximum: 150 }

end
