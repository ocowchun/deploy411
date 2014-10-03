namespace :utils do

  desc 'Show deployed revision'
  task :revision do
    on roles(:app) do
      rev    = capture "cat #{ current_path }/REVISION"
      puts "  * REVISION: #{ rev }"    if rev
      rake "slack:notify REVISION=#{rev}" 
    end
  end



end
