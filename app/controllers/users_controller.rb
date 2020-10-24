class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(10).order("updated_at DESC")
    @users = User.all
    # いいねされた総数を取得
    @favorites = Favorite.where(post_id: current_user.posts.ids).count
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "登録情報を更新しました。"
    else
      render "edit"
    end
  end

  def follows
  end

  def followers
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :name, :email, :introduction, :layout, :size)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
