# frozen_string_literal: true

class PositionsController < ApplicationController
  attr_reader :stock
  before_action :find_stock, only: [:ack]

  def index
    @long_term_stocks = LongTermStock.all.order(:notified_at)
  end

  def ack
    stock.update!(acked_at: Time.current)

    respond_to do |format|
      format.js
    end
  end

  private

  def find_stock
    @stock ||= LongTermStock.find(params[:id])
  end
end
