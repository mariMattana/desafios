class Api::V1::UsersController < Api::V1::BaseController
  def index
    @users = policy_scope(User).search_by_first_and_last_name(params[:query])
  end
end
