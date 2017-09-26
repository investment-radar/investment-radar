class NoticesMailer < ApplicationMailer
  def notify_to_sell(email:)
    @stocks = LongTermStock.all

    subject = "Stock:"

    @stocks.each do |stock|
      subject += " #{stock.action}-#{stock.stock_symbol.upcase}"
    end

    puts subject

    mail to: email, subject: subject
  end
end
