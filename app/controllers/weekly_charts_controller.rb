# frozen_string_literal: true

class WeeklyChartsController < BaseChartsController
  def index
    token = Rails.application.credentials[Rails.env.to_sym][:decision_engine_token]
    render json: DecisionEngine::WeeklyChart.new(token).call(params[:symbol])
  end
end
