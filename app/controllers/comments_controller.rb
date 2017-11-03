class CommentsController < ApplicationController
  before_action :authorize
  before_action :authorize_edit, except: [:create]

  def create
    @campground = Campground.find(params[:campground_id])
    @comment = Comment.new(comment_params)
    @comment.campground = @campground
    @comment.user = current_user
    if @comment.save
      params[:images].each { |image| @comment.comment_images.create(image: image) } if params[:images]
      redirect_to campground_path(@comment.campground)
    else
      render :new
    end
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
end