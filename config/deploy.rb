require "bundler/capistrano"
require 'rvm/capistrano'

set :rvm_type, :system
# set :rvm_bin_path, "$HOME/.rvm/bin"
# set :rvm_bin_path, "/usr/local/rvm/bin"

set :user, 'root'
# Test Server
set :domain, '128.199.116.50'
set :application, 'mailer_desk'

#ssh_options[:port] = 16888
#ssh_options[:forward_agent] = true
default_run_options[:pty] = true
set :rvm_type, :system

# To deploy from local machine
# set :repository,  "."
# set :repository,  "."
# set :local_repository,  "."
# set :deploy_via, :copy

set :deploy_to, "/var/www/rails_apps/#{application}"

set :repository,  "https://github.com/sudheerm16/Dynamic-Email-Generator.git"
set :local_repository,  "https://github.com/sudheerm16/Dynamic-Email-Generator.git"

# set :repository,  "git@github.com:sudheerm16/Dynamic-Email-Generator.git"
# set :local_repository,  "git@github.com:sudheerm16/Dynamic-Email-Generator.git"
set :scm, 'git'
set :branch, 'master'
# # set :branch, 'test'
# # set :branch, 'attendance'
# set :branch, 'performace'
set :scm_verbose, true
set :use_sudo, false
set :keep_releases, 1

server domain, :app, :web

# before "deploy:restart", :symlink_directories
# task :symlink_directories do
#
#   puts "shared_path ===== >>> #{shared_path}"
#   puts "release_path ===== >>> #{release_path}"
#
#   run "ln -nfs #{shared_path}/carrierwave #{release_path}/public/carrierwave"
#   run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
# end

# Show the recent logs
namespace :log do
  desc "display the site logs"
  task :web do
    run "cd #{current_path}; tail -f ./log/production.log"
  end

  # desc "display the sidekiq logs"
  # task :sidekiq do
  #   run "cd #{current_path}; tail -f ./log/sidekiq.log "
  # end

end

namespace :rails do
  desc "open the rails console"
  task :console do
    run_interactively "cd #{current_path}; RAILS_ENV=production bundle exec rails c "
  end
end

namespace :deploy do

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(release_path,'tmp','restart.txt')}"
    run "sudo mkdir /var/www/rails_apps/#{application}/current/public/pids"

    run "rm -Rf #{release_path}/public/uploads"
    run "ln -nfs #{shared_path}/uploads #{current_path}/public/uploads"
    run "ln -nfs #{shared_path}/database.yml #{current_path}/config/database.yml"

    run "sudo chmod 0777 -fR /var/www/rails_apps/#{application}/*"
    # run "cd; sh server_restart.sh"
  end
end

after 'deploy:update_code' do
  run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
  run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
  run "cd #{release_path}; RAILS_ENV=production bundle exec rake db:create"
  run "cd #{release_path}; RAILS_ENV=production bundle exec rake db:migrate"
  # run "cd #{release_path}; RAILS_ENV=production bundle exec rake db:seed"
  # run "cd #{release_path}; RAILS_ENV=production bundle exec rake db:mongoid:create_indexes"
end