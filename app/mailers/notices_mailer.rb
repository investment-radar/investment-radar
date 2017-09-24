class NoticesMailer < ApplicationMailer
  def notify_to_sell(email:, results:)
    @results = results

    subject = "Stock:"

    @results.each do |result|
      subject += " #{result.action}-#{result.symbol.upcase}"
    end

    puts subject

    mail to: email, subject: subject
  end
end
