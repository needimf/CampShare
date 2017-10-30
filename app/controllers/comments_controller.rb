class CommentsController < ApplicationController
  before_action :authorize
  before_action :edit_authorize, except: [:new, :create]

  def new
    @campground = Campground.find(params[:campground_id])
    @comment = Comment.new
  end

  def create
    @campground = Campground.find(params[:campground_id])
    @comment = Comment.new(comment_params)
    @comment.campground = @campground
    @comment.user = current_user
    if @comment.save
      redirect_to campground_path(@comment.campground)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(comment_params)
      redirect_to campground_path(@comment.campground)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @campground = @comment.campground
    @comment.destroy
    redirect_to campground_path(@campground)
  end

private
  
  def comment_params
      params.require(:comment).permit(:content)
  end

  def edit_authorize
    comment = Comment.find(params[:id])
    redirect_to campground_path(comment.campground), alert: "Not authorized - you did not author this comment!" if current_user != comment.user
  end
end