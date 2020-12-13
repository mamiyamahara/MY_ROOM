# frozen_string_literal: true

class PostsController < ApplicationController
  # 複数回出てくる箇所「@post = Post.find(params[:id])」をprivate以下にset_postアクションとして定義し、
  # 適応したいアクションset_postをbefore_actionに指定することで、
  # %i[]内のアクションが実行される前にset_postアクションが実行される。同じ記述がなくなってスッキリする。
  before_action :set_post, only: %i[show edit update destroy]

  # ログインしていないとURLを入力しても表示されないようにする。
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), success: '投稿が完了しました。'
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all.page(params[:page]).per(20).order('updated_at DESC')
  end

  def show
    @post_comment = PostComment.new
    @post_comments = @post.post_comments
  end

  def edit
    if @post.user == current_user
      render 'edit'
    else
      redirect_to user_path
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), success: '投稿が完了しました。'
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
