class BetsController < ApplicationController
 def index
    @bets = Bet.all
  end

  def show
    @bet = Bet.find(params[:id])
  end

  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(challenge_params)
    @bet.user = current_user
    if @bet.save
      redirect_to bet_path(@bet)
    else
      render :new
    end
  end

  def edit
    @bet = Bet.find(params[:id])
  end

  def update
    @bet = Bet.find(params[:id])
    @bet.update(bet_params)
    redirect_to bets_path
  end

  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy
    redirect_to bets_path
  end

  private

  def challenge_params
    params.require(:bet).permit(:value, :description, :start_date, :end_date, :value)
  end
end
