class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.all
    @posts = Post.order(created_at: :desc)
    @maps = Map.all
    # @posts = @customer.posts
  end

  def new
    @post = Post.new
  end

  def show
    # @posts = Post.order(created_at: :desc)
    # @posts = Post.all
    # @post = Post.new
    @post = Post.find(params[:id])
    # @post_comment = PostComment.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
        flash[:notice] = 'You have created item successfully'
        redirect_to admin_posts_path
        # redirect_to public_post_path(post.id)# @postのidを指定して詳細ページへリダイレクト
    else
      # @posts = Post.all
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       redirect_to admin_post_path
    else
      render :edit
    end
  end

private

  def post_params
    params.require(:post).permit(:image, :title, :body, :place, :lat, :lng, :category)#, :star, :comment)
  end

end
