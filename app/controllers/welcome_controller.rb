# frozen_string_literal: true

class WelcomeController < ApplicationController
  # :nocov:
  def index
    logger.info 'Welcome page!'

    @market_news = IEX::Resources::News.get(:market, 10)
    @stocks_news = []
    LongTermStock.all.each do |stock|
      news = IEX::Resources::News.get(stock.stock_symbol)
      @stocks_news.push(*news)
    end

    render :index
  end
  # :nocov:
end
