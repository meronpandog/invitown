class Public::PostsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @posts = Post.all
    # @posts = @customer.posts
  end

  # def new
  #   @post = Post.new
  # end

  def show
    # @posts = Post.all
    # @post = Post.new
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @customer = current_customer
    # @customer = @post_comment.customer
  end

  # def create
  #   @post = Post.new(post_params)
  #   @post.customer = current_customer
  #   if @post.save
  #       flash[:notice] = 'You have created item successfully'
  #       redirect_to public_posts_path
  #       # redirect_to public_post_path(post.id)# @postのidを指定して詳細ページへリダイレクト
  #   else
  #     # @posts = Post.all
  #     render :new
  #   end
  # end

  # def destroy
  #   @post = Post.find(params[:id])
  #   @post.destroy
  #   redirect_to public_posts_path
  # end

  # def edit
  #   @post = Post.find(params[:id])
  # end

  # def update
  #   @post = Post.find(params[:id])
  #   if @post.update(post_params)
  #     redirect_to public_post_path(@post)
  #   else
  #     render :edit
  #   end
  # end

private

  def post_params
    params.require(:post).permit(:image, :title, :body)#, :star, :comment)
  end

end
