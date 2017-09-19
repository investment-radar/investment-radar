class NoticesMailer < ApplicationMailer
  def notify_to_sell(email:)
    @results = StockService.call

    subject = "Stock:"

    @results.each do |result|
      subject += " #{result.action}-#{result.symbol}"
    end

    puts subject

    mail to: email, subject: subject
  end
end
