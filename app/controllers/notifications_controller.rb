class NotificationsController < ApplicationController
  acts_as_token_authentication_handler_for User, except: [ :index ]

  def index
    @notifications = policy_scope(Notification).order(created_at: :desc)
  end

  def update
    @notification = Notification.find(params[:id])
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
