# frozen_string_literal: true

desc 'This task is called by the Heroku scheduler add-on'

# run with scheduler every hour during the trading time. Now scheduler removed.
task send_reminders: :environment do
  SellStockNotifier.call
  puts 'Call SellStockNotifier!'
end
