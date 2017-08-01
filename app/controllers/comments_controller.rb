class CommentsController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def create 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:author_id, :body, :author_type))
    if @comment.body.empty?
      redirect_to post_path(@post), flash: { notice: "Comment Can`t be Blank", class: "alert-danger" }
    else
      redirect_to post_path(@post),  flash: { notice: "Comment Added", class: "alert-success" }
    end
    
  end
end