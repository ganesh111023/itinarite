class CommentsController < ApplicationController
  before_action :find_trip
  before_action :find_comment, only: [:destroy, :update]

  #/trips/:trip_id/comments
  def create
    comment = @trip.comments.new({description: params[:description] })
    comment.user_id = current_user.id
    respond_to do |format|
      if comment.save
         format.js   { }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
         format.js   { }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update_column(:description, params[:description])
         format.js   { }
      end
    end
  end

  private
    def find_trip
      @trip = current_user.trips.find params[:trip_id]
    end
    def find_comment
      find_trip
      @comment = @trip.comments.find(params[:id])
    end
end
