class ProgressesController < ApplicationController
  def index
    @progresses = policy_scope(Progress)
  end

  def show
    @progress = Progress.find(params[:id])
    authorize @progress
  end

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @progress = Progress.new
    authorize @progress
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @progress = Progress.new(progress_params)
    @progress.challenge_id = @challenge.id
    @progress.user_id = current_user
    authorize @progress
    if @progress.save
      render :show
    else
      render :new
    end
  end

  def edit
    @challenge = Challenge.find(params[:challenge_id])
    @progress = Progress.find(params[:id])
    authorize @progress
  end

  def update
    @challenge = Challenge.find(params[:challenge_id])
    @progress = Progress.find(params[:id])
    @progress.update(progress_params)
    authorize @progress
    redirect_to challenge_progresses_path
  end

  def destroy
    @progress = Progress.find(params[:id])
    @progress.destroy
    authorize @progress
    redirect_to challenge_bets_path
  end

  private

  def progress_params
    params.require(:progress).permit(:title, :description, :date, :photo,
      :user_id, :challenge_id)
  end
end
