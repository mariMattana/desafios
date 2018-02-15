class Api::V1::ChallengesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_challenge, only: [ :show, :update, :destroy ]

  def index
    @challenges = policy_scope(Challenge)
  end

  def show
  end

  def update
    if @challenge.update(challenge_params)
      notifyBetUsers
      render json: {}, status: 200
    else
      render_error
    end
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
    authorize @challenge
    if @challenge.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @challenge.destroy
    head :no_content
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
    authorize @challenge  # For Pundit
  end

  def challenge_params
    params.require(:challenge).permit(:title, :description, :start_date, :end_date, :value, :completed)
  end

  def render_error
    render json: { errors: @challenge.errors.full_messages },
      status: :unprocessable_entity
  end

  def notifyBetUsers
    # UserMailer.invitation(@challenge.user, @bet.user).deliver_now
    bets = Bet.where(challenge: @challenge)
    bets.each do |bet|
      if bet.accepted == "accepted"
        if @challenge.completed
          Notification.create!(recipient: bet.user, actor: @challenge.user, action: "completou seu desafio", notifiable: bet)
        else
          Notification.create!(recipient: bet.user, actor: @challenge.user, action: "não conseguiu completar seu desafio", notifiable: bet)
        end
      elsif bet.accepted == "waiting_confirmation"
        bet.accepted = "declined"
        bet.save
      end
    end
  end
end
