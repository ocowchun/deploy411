namespace :utils do
  desc "use slack to notify deployment message"
  task :revision do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          rev    = capture "cat #{ current_path }/REVISION"
          puts "  * REVISION: #{ rev }"    if rev
          rake "slack:notify REVISION=#{rev}"
        end
      end
    end
  end
end
