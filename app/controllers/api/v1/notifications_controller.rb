class Api::V1::NotificationsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_notification, only: [ :update ]

  def index
    @notifications = policy_scope(Notification).where(recipient: current_user).order(created_at: :desc)
  end

  def update
    if @notification.read_at == nil
      @notification.update(read_at: DateTime.now)
      render json: {}, status: 200
    else
      render_error
    end
  end


private

  def set_notification
    @notification = Notification.find(params[:id])
    authorize @notification  # For Pundit
  end

  def notification_params
    params.require(:notification).permit(:read_at)
  end

  def render_error
    render json: { errors: @notification.errors.full_messages },
      status: :unprocessable_entity
  end
end
