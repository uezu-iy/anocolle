class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
      @comment.destroy
      flash[:success] = "コメント削除完了"
      redirect_to anomaly_path(@comment.anomaly_id)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment_content, :anomaly_id)
  end
end
