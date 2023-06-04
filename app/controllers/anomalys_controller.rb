class AnomalysController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update destroy edit]
  def index
    @q = Anomaly.ransack(params[:q])
    @anomalys = @q.result.includes(:tags, :anomaly_tags, :user).page(params[:page]).per(7)
    @tag_list=Tag.all
  end

  def new
    @user = current_user
    @anomaly = Anomaly.new
  end
  
  def create
    @anomaly = current_user.anomalys.new(anomaly_params)
    tag_list = params[:anomaly][:tag_name].split(',')
    if @anomaly.save
      @anomaly.save_tag(tag_list)
      flash[:notice] = "新規投稿をしました"
      redirect_to :anomalys
    else
      render "new"
    end
  end

  def show
    @anomaly = Anomaly.find(params[:id])
    @anomaly_tags = @anomaly.tags
    @comments = @anomaly.comments
  end

  def edit
    @user = current_user
    @anomaly = Anomaly.find(params[:id])
    @tag_list=@anomaly.tags.pluck(:tag_name).join(',')
  end

  def update
    @anomaly = Anomaly.find(params[:id])
    tag_list = params[:anomaly][:tag_name].split(',')
    if @anomaly.update(anomaly_params)
      # このanomaly_idに紐づいていたタグを@oldに入れる
      @old_relations=AnomalyTag.where(anomaly_id: @anomaly.id)
      # それらを取り出し消す。
      @old_relations.each do |relation|
      relation.delete
      end  
      @anomaly.save_tag(tag_list)
      redirect_to anomaly_path(@anomaly.id), notice: '更新完了しました'
    else
      render "edit"
    end
  end

  def destroy
    @anomaly = Anomaly.find(params[:id])
      @anomaly.destroy
      flash[:notice] = "削除しました"
      redirect_to anomalys_path
  end

  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @anomalys = @tag.anomalys.includes(:tags, :anomaly_tags, :user).page(params[:page]).per(7)
  end

  private
  def anomaly_params
    params.require(:anomaly).permit(:title, :content, :user_id)
  end
end
