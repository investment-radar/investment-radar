desc "This task is called by the Heroku scheduler add-on"

task :send_reminders => :environment do
  NoticesMailer.notify_to_sell(email: 'bing708@gmail.com').deliver_later
  puts "Email notification sent!"
end
