class NoticesMailer < ApplicationMailer
  def notify_to_sell(email:)
    @stocks = LongTermStock.all

    subject = "(#{Rails.env}) Stock:"

    @stocks.each do |stock|
      subject += " #{stock.action}-#{stock.stock_symbol.upcase}"
    end

    logger.info "logger Email subject: #{subject}"

    puts "Email subject: #{subject}"

    mail to: email, subject: subject
  end
end
