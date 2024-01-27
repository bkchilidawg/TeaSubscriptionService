class Api::V0::Customers::SubscriptionsController < ApplicationController

  def index
    begin
      customer = Customer.find(params[:id])
      subscriptions = customer.subscriptions
      render json: SubscriptionSerializer.new(subscriptions)
    rescue ActiveRecord::RecordNotFound => exception
      render json: ErrorSerializer.new(Error.new(exception)).error_json, status: 404
    end
  end
end