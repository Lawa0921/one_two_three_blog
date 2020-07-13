class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = target_site.posts.new
  end

  def create
    @post = target_site.posts.new(post_params)
    if @post.save
      redirect_to site_path(user_name: target_user.name, id: target_site.title)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to site_path(user_name: target_user.name, id: target_site.title)
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to site_path(user_name: target_user.name, id: target_site.title)
    else
    end
  end

  def show
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
