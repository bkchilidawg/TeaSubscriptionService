class Api::V0::SubscriptionsController < ApplicationController

  def create
    begin
      customer = Customer.find(params[:customer_id])
      tea = Tea.find(params[:tea_id])
      subscription = Subscription.create!(subscription_params)
      render json: SubscriptionSerializer.new(subscription), status: 201
    rescue ActiveRecord::RecordNotFound => exception
      render json: ErrorSerializer.new(Error.new(exception)).error_json, status: 404
    end
  end

  def cancel
    begin
      subscription = Subscription.find(params[:id])
      subscription.update!(status: 1)
      render json: SubscriptionSerializer.new(subscription)
    rescue ActiveRecord::RecordNotFound => exception
      render json: ErrorSerializer.new(Error.new(exception)).error_json, status: 404
    end
  end

  private
  
  def subscription_params
    params.permit(:customer_id, :tea_id, :frequency, :price, :title)
  end
end