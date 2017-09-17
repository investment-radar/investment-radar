class StockService
  include Concerns::Service

  attr_reader :stock_symble

  def initialize(stock_symble)
    @stock_symble = stock_symble
  end

  def call
    puts stock_symble
  end
end
