namespace :slack do
	desc "Send deploy message to Slack."
	task notify: :environment do
		revision = ENV["REVISION"] || 2

		commit_url="https://github.com/ocowchun/deploy411/commit/#{revision}"
		notifier = Slack::Notifier.new "achilles", ENV["slack_token"],
			channel: '#co-work', username: '容嘉'
		notifier.ping "部署成功了噢:blush: #{commit_url}",icon_url:'http://static.nownews.com/newspic/2218/i2218344.jpg'
	end
end
