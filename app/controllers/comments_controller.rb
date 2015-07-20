class CommentsController < ApplicationController
  before_action :set_commentable
  
  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end

private

  def set_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.classify.constantize.find(id)
  end
  
  def comment_params
    params.require(:comment).permit(:content)
  end

end