class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @anomalys = Anomaly.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end
end
