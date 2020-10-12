class Post < ApplicationRecord

    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :post_comments, dependent: :destroy

    attachment :post_image_id, destroy: false

	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, :body, :post_image_id, presence: true

end
