class AnomalysController < ApplicationController
  def index
    @q = Anomaly.ransack(params[:q])
    @anomalys = @q.result
    @tag_list=Tag.all
  end

  def new
    @anomaly = Anomaly.new
  end
  
  def create
    @anomaly = Anomaly.new(anomaly_params)

    tag_list = params[:anomaly][:tag_name].split(',')
    if @anomaly.save
      @anomaly.save_tag(tag_list)
      flash[:notice] = "新規登録をしました"
      redirect_to :anomalys
    else
      render "new"
    end
  end

  def show
    @anomaly = Anomaly.find(params[:id])
    @anomaly_tags = @anomaly.tags
  end

  def edit
    @anomaly = Anomaly.find(params[:id])
    @tag_list=@anomaly.tags.pluck(:tag_name).join(',')
  end

  def update
    @anomaly = Anomaly.find(params[:id])
     if @anomaly.update(anomaly_params)
       flash[:notice] = "更新しました"
       redirect_to :anomalys
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

  private
  def anomaly_params
    params.require(:anomaly).permit(:title, :content)
  end
end
