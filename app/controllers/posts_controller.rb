class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), success: "投稿が完了しました。"
    else
      render "new"
    end
  end

  def index
    @posts = Post.all.page(params[:page]).per(20).order("updated_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render "edit"
    else
      redirect_to user_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), success: "投稿が完了しました。"
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path
  end

  def ranking
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image)
  end
end
