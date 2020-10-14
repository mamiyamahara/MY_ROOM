class ApplicationController < ActionController::Base

	# クロスサイトリクエストフォージェリー（CSRF）対策のコード。
	# 不正な行為(アクセス回数稼ぎなど)をブロック
	protect_from_forgery with: :exception
	# ログインしていないと入れないようにする。
	before_action :configure_permitted_parameters, if: :devise_controller?


    # サインアップ時にニックネームも登録できるようにストロングパラメーターを追加
    def configure_permitted_parameters
    	added_attrs = [ :name, :email, :password, :password_confirmation ]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end

    def after_sign_in_path_for(resources)
        user_follows_path(resources)
    end

end
