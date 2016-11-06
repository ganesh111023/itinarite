class PostsController < ApplicationController

  def create
    if request.xhr?
      @post = current_user.posts.create(posts_params)
      @posts = Post.self_and_following_user_post(current_user)
    end
  end

  def comment
    if request.xhr?
      @post = Post.find params[:id]
      @posts = Post.self_and_following_user_post(current_user)
      comment = @post.comments.new(description: params[:description])
      comment.user_id = current_user.id
      comment.save
    end
  end


  private
    def posts_params
      params.permit(:description, :address,:user_id)
    end
end
