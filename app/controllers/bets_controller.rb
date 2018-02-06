class BetsController < ApplicationController
 def index
    @bets = policy_scope(Bet)
  end

  def show
    @bet = Bet.find(params[:id])
    authorize @bet
  end

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @bet = Bet.new
    authorize @bet
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @bet = Bet.new(bet_params)
    @bet.challenge_id = @challenge.id
    authorize @bet
    if @bet.save
      UserMailer.invitation(@challenge.user, @bet.user).deliver_now
      puts "saved"
      render "bets/create"
    else
      render :new
    end
  end

  def edit
    @challenge = Challenge.find(params[:challenge_id])
    @bet = Bet.find(params[:id])
    authorize @bet
  end

  def update
    @challenge = Challenge.find(params[:challenge_id])
    @bet = Bet.find(params[:id])
    @bet.update(bet_params)
    authorize @bet
    redirect_to challenge_bets_path
  end

  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy
    authorize @bet
    redirect_to challenge_bets_path
  end

  private

  def bet_params
    params.require(:bet).permit(:user_id)
  end
end
