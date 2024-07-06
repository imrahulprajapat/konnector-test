class UsersController < ApplicationController

  def index
    users = User.all

    render :json => users.present? ? users : 'no records found, please create some', status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render :json => user, status: :created
    else
      render json: user.errors.full_messages, status: :forbidden
    end
  end

  def filter
    campaign_names = params[:campaign_names].split(',')
    binding.pry
    render :json => User.json_search(campaign_names), status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, campaigns_list: [:campaign_name, :campaign_id])
  end
end
