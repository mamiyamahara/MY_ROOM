# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
	[
		{
	        id: "1",
	        email: "test1@test.com",
	        name: "テスト",
	        password: "111111",
	        password_confirmation: "111111",
	        profile_image: File.open("./app/assets/images/profile_image.jpeg"),
	        introduction: "一人暮らし歴1年目です。よろしくお願いします。",
	        layout: "1R",
	        size: "18㎡"
        },

        {
	        id: "2",
	        email: "test2@test.com",
	        name: "テスト2",
	        password: "222222",
	        password_confirmation: "222222",
	        profile_image: File.open("./app/assets/images/profile_image2.jpeg"),
	        introduction: "はじめまして！来年から一人暮らし予定で、参考になるインテリアを探しています。よろしくお願いします。",
	        layout: "1DK(予定)",
	        size: "18㎡(予定)"
        },

        {
	        id: "3",
	        email: "test3@test.com",
	        name: "テスト3",
	        password: "333333",
	        password_confirmation: "333333",
	        profile_image: File.open("./app/assets/images/profile_image3.jpeg"),
	        introduction: "はじめまして。大学入学をきっかけに、去年から一人暮らしをはじめました。最近は植物大好きで色々育てています。一人暮らしする前はまだイメージがついていなかったので、ベランダのない部屋を選んでしまい、少し後悔しています(笑)",
	        layout: "1K",
	        size: "16㎡"
        },
    ]
    )

# Post.create!(
# 	[
# 		{
#         	user_id: "1",
# 	        id: "1",
# 	        title: "モノトーンインテリア",
# 	        body: "こだわりポイントはテレビを見ながら寝られるソファの配置です。映画が好きなので、気づいたら観ながらソファで寝てしまっていることもしばしば。見えませんが、一番手前にベッドもあります。テレビの配線をもう少しきれいにしたいので、いい案があればコメントください。",
# 	        post_image: File.open("./app/assets/images/interior_photo1.jpg")
#         },

#         {
#         	user_id: "1",
# 	        id: "2",
# 	        title: "キッチンの収納",
# 	        body: "あまり物を置きたくないのですが、すぐ使えるようにグラスと調味料だけは置いています。調理器具は全てステンレスにして統一感を出しています。",
# 	        post_image: File.open("./app/assets/images/kitchen_interior.jpg")
#         },

# 		{
#         	user_id: "3",
# 	        id: "1",
# 	        title: "ウッディ調インテリア？",
# 	        body: "暖かい感じのインテリアが好きなので、木×緑なインテリアになるように意識しています。予算的にあまり新しい家具を買ったりする余裕がなかったので、ドレッサーと椅子は実家にあった物を持ってきてそのまま使っています(笑)",
# 	        post_image: File.open("./app/assets/images/interior_photo2.jpg")
#         },
#     ]
#     )
