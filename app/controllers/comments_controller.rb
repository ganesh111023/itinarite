class CommentsController < ApplicationController

  #/trips/:trip_id/comments
  def create
    @trip = current_user.trips.find params[:trip_id]
    comment = @trip.comments.new({description: params[:description] })
    comment.user_id = current_user.id
    respond_to do |format|
      if comment.save
         format.js   { }
      end
    end
  end

  def destroy
    @trip = current_user.trips.find params[:trip_id]
    comment = @trip.comments.find(params[:id])
    respond_to do |format|
      if comment.destroy
         format.js   { }
      end
    end
  end

  def update
    @trip = current_user.trips.find params[:trip_id]
    comment = @trip.comments.find(params[:id])
    respond_to do |format|
      if comment.update_column(:description, params[:description])
         format.js   { }
      end
    end
  end
end
