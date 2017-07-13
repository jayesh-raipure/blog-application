class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
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
        format.html { redirect_to @post, notice: "Blog Updated Successfully." }
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
        format.html { redirect_to @post,  notice: "Blog Created Successfully." }
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

  private
    def post_params
      params.require(:post).permit(:title, :content, :author_id)
    end
end
