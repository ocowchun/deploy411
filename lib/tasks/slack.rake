namespace :slack do
  desc "Send deploy message to Slack."
  task notify: :environment do
    revision = ENV["REVISION"] || 2

    notifier = Slack::Notifier.new "achilles", ENV["slack_token"],
      channel: '#co-work', username: '容嘉'
    notifier.ping "REVISION:#{revision} :blush:",icon_url:'http://static.nownews.com/newspic/2218/i2218344.jpg'
  end
end
