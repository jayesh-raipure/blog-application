class PostsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show, :create]
  before_action :check_author, only:[:edit, :update, :destroy]
  def index
    @posts = Post.order("created_at DESC")
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, flash: { notice: "Blog Updated Successfully.", class: "alert-success"} }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def create 
    @post = Post.new(post_params)
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post,  flash: { notice: "Blog Created Successfully.", class: "alert-success" } }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Blog was successfully Deleted.' }
      format.json { head :no_content }
    end
  end
  
  def myposts
    @posts = current_user.posts
    render "posts/index"
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :author_id)
    end

    def check_author
      @post = Post.find(params[:id])
      unless @post.author_id == current_user.id
        redirect_to post_path(params[:id]), flash: { notice: "Access denied as you are not author of this Post", class: "alert-danger" }
      end
    end
end