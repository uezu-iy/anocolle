class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @anomaly = Anomaly.find(params[:anomaly_id])
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:success] = "コメント投稿しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "コメントを入力してください"
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
