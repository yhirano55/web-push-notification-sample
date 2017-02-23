class Api::V1::SubscriptionsController < ApplicationController
  def create
    Subscription.find_or_create_by!(endpoint: permitted_params[:endpoint]) do |subscription|
      subscription.p256dh = permitted_params.dig(:keys, :p256dh)
      subscription.auth   = permitted_params.dig(:keys, :auth)
    end

    head :ok
  end

  private

  def permitted_params
    params.require(:subscription).permit(:endpoint, keys: [:p256dh, :auth])
  end
end
