class Api::V1::BetsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_bet, only: [ :show, :update, :destroy ]

  def index
    @bets = policy_scope(Bet).where(challenge_id: params[:challenge_id])
  end

  def show
  end

  def update
    if @bet.update(bet_params)
      render :show
    else
      render_error
    end
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @bet = Bet.new(bet_params)
    @bet.challenge_id = @challenge.id
    @bet.accepted = 1
    authorize @bet
    if @bet.save
      # inviteUserToBet
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @bet.destroy
    head :no_content
  end

  private

  def set_bet
    @bet = Bet.find(params[:id])
    authorize @bet  # For Pundit
  end

  def bet_params
    params.require(:bet).permit(:value, :accepted, :user_id, :challenge_id)
  end

  def render_error
    render json: { errors: @bet.errors.full_messages },
      status: :unprocessable_entity
  end

  def inviteUserToBet
    UserMailer.invitation(@challenge.user, @bet.user).deliver_now
  end
end
