class AnomalysController < ApplicationController
  def index
    @anomalys = Anomaly.all
  end

  def new
    @anomaly = Anomaly.new
  end
  
  def create
    @anomaly = Anomaly.new(anomaly_params)

    respond_to do |format|
      if @anomaly.save
        format.html { redirect_to anomaly_url(@anomaly), notice: "Message was successfully created." }
        format.json { render :show, status: :created, location: @anomaly }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @anomaly.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def anomaly_params
    params.require(:anomaly).permit(:title, :content)
  end
end
