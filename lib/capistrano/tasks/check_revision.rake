require 'slack-notifier'

namespace :utils do

  desc 'Show deployed revision'
  task :revision do
    on roles(:app) do
      rev    = capture "cat #{ current_path }/REVISION"
      # branch = capture_current_branch
      puts "  * REVISION: #{ rev }"    if rev
      # puts "  * BRANCH:   #{ branch }" if branch
      notifier = Slack::Notifier.new "achilles", ENV['slack_token'],
        channel: '#co-work', username: 'Nono'
      notifier.ping "部署成功了噢:blush:",icon_url:'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/t1.0-1/c44.44.555.555/s200x200/165418_277489942387700_732609952_n.jpg'

    end
  end



end
