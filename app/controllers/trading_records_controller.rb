# frozen_string_literal: true

class TradingRecordsController < ApplicationController
  def index
    report = TradingRecord.report

    @sorted_records = report.sort_by {|_key, value| value}
    @total_profit = report.values.sum.round(2)
  end
end
