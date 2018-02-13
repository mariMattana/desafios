class Api::V1::BetsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show, :update ]
  before_action :set_bet, only: [ :show, :update, :destroy ]

  def index
    @bets = policy_scope(Bet).where(challenge_id: params[:challenge_id])
  end

  def show
  end

  def update
    if @bet.update(bet_params)
      if @bet.completed.nil?
        reply_to_challenge_user
      else
        end_bet
      end
      render json: {}, status: 200
    else
      render_error
    end
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @bet = Bet.new(bet_params)
    @bet.challenge_id = @challenge.id
    @bet.accepted = "waiting_confirmation"
    authorize @bet
    if @bet.save
      inviteUserToBet
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
    params.require(:bet).permit(:value, :accepted, :user_id, :challenge_id, :completed)
  end

  def render_error
    render json: { errors: @bet.errors.full_messages },
      status: :unprocessable_entity
  end

  def inviteUserToBet
    UserMailer.invitation(@challenge.user, @bet.user).deliver_now
    Notification.create!(recipient: @bet.user, actor: @challenge.user, action: "convidou", notifiable: @bet)
  end

  def reply_to_challenge_user
    # UserMailer.invitation(@challenge.user, @bet.user).deliver_now
    if @bet.accepted == "accepted"
      Notification.create!(recipient: @bet.challenge.user, actor: @bet.user, action: "aceitou a aposta", notifiable: @bet)
    elsif @bet.accepted == "declined"
      Notification.create!(recipient: @bet.challenge.user, actor: @bet.user, action: "recusou a aposta", notifiable: @bet)
    end
  end

  def end_bet
    if @bet.completed
      Notification.create!(recipient: @bet.challenge.user, actor: @bet.user, action: "concordou", notifiable: @bet)
    else
      Notification.create!(recipient: @bet.challenge.user, actor: @bet.user, action: "não concordou", notifiable: @bet)
    end
    # create payment
  end
end
