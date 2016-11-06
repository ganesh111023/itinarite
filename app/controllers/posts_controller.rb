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
      comment = @post.comments.new(description: params[:description])
      comment.user_id = current_user.id
      comment.save
      if URI(request.referer).path == "/profile"
        @posts = Post.self_and_following_user_post(current_user)
      else
        @recent_activities = ActivityLog.following_user_activities(current_user)
        @recent_activities << Post.self_and_following_user_post(current_user) 
        @recent_activities = @recent_activities.flatten.sort{ |a,b| b.created_at <=> a.created_at }
      end
    end
  end


  private
    def posts_params
      params.permit(:description, :address,:user_id)
    end
end
