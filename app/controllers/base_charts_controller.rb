# frozen_string_literal: true

class BaseChartsController < ApplicationController
  before_action :alphavantage_client

  private

  def alphavantage_client
    @alphavantage_client ||= Alphavantage::Client.new key: 'Q8KDMSMYB6O7TDZS'
  end
end
