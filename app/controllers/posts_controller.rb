class PostsController < ApplicationController
  before_action :set_post, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index, :show]
  before_action :edit_post, only:[:edit]


  def index
    @q = Post.search(params[:q])
    @posts = @q.result.page(params[:page]).per(9)
  end

  def current_user_index
    @posts = current_user.posts.all
  end

  def new
    @post = Post.new
  end

  def confirm
    @post = Post.new(post_params)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice:"新しい投稿をしました"
    else
      render "new"
    end
  end

  def show
    @comments = @post.comments
    @comment = @post.comments.build
    render layout: false
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice:"投稿を編集をしました"
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"投稿を削除しました"
  end


  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def edit_post
    unless @post.user_id == current_user.id
      redirect_to posts_path, notice: "編集できません。ユーザーを確認して下さい！"
    end
  end

end
