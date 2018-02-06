class Api::V1::ChallengesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_challenge, only: [ :show, :update, :destroy ]

  def index
    @challenges = policy_scope(Challenge)
  end

  def show
  end

  def update
    if @challenge.update(challenge_params)
      render :show
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
end
