class ChallengesController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

  def index
    @challenges = policy_scope(Challenge).order(start_date: :desc)
  end

  def show
    if params[:query].present?
      @users =  User.search_by_first_and_last_name(params[:query])
    else
      @users = User.all
    end
    @challenge = Challenge.find(params[:id])
    @bets = Bet.where(challenge: @challenge)
    @progress = Progress.new
    @progresses = Progress.where(challenge: @challenge)
    authorize @challenge
  end

  def new
    @challenge = Challenge.new
    authorize @challenge
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
    @challenge.completed = nil
    authorize @challenge
    if @challenge.save
      redirect_to challenge_path(@challenge)
    else
      render :new
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
    authorize @challenge
  end

  def update
    @challenge = Challenge.find(params[:id])
    @challenge.update(challenge_params)
    authorize @challenge
    redirect_to challenges_path
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    authorize @challenge
    @challenge.destroy
    redirect_to challenges_path
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :description, :start_date, :end_date, :value, :progresses_attributes)
  end
end
