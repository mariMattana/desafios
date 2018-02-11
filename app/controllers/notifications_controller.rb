class NotificationsController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :set_notification, only: [ :index, :update ]

  def index
    @notifications = policy_scope(Notification)
  end

  def update
    if @notification.update(notification_params)
      render :show
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
    params.require(:notification).permit(:read)
  end

  def render_error
    render json: { errors: @notification.errors.full_messages },
      status: :unprocessable_entity
  end
end
