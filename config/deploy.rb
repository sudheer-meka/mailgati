set :application, 'MailGati'
set :repository,  'https://sudheerm16@bitbucket.org/sudheerm16/mailgati.git'
set :deploy_to, "/var/www/rails_apps/#{application}"
set :scm, :git
set :branch, 'master'
set :user, 'sudheer'
# set :scm_passphrase, 'NUpFEUM+j8LhxNyIz9lq7X2XurDltdL+WzEn3EjzJTc='
set :use_sudo, true
set :rails_env, 'production'
set :deploy_via, :copy
set :keep_releases, 5
default_run_options[:pty] = true
server "188.166.255.222", :app, :web, :db, :primary => true


namespace :deploy do

  task :restart, :roles => :app, :except => { :no_release => true } do
    # run "touch #{File.join(release_path,'tmp','restart.txt')}"
    run "mkdir /var/www/rails_apps/#{application}/current/public/pids"

    # run "rm -Rf #{release_path}/public/carrierwave"
    # run "rm -Rf #{release_path}/public/uploads"
    # run "rm -Rf #{release_path}/public/documents"

    # run "ln -nfs #{shared_path}/carrierwave #{current_path}/public/carrierwave"
    # run "ln -nfs #{shared_path}/uploads #{current_path}/public/uploads"
    # run "ln -nfs #{shared_path}/documents #{current_path}/public/documents"
    # run "ln -nfs #{shared_path}/attendance_process.xls #{current_path}/public/attendance_process.xls"
    # run "ln -nfs #{shared_path}/combined_register.xls #{current_path}/public/combined_register.xls"
    # run "ln -nfs #{shared_path}/rollover.xls #{current_path}/public/rollover.xls"
    # run "ln -nfs #{shared_path}/report_content.xls #{current_path}/public/report_content.xls"
    # run "ln -nfs #{shared_path}/salary_register.xls #{current_path}/public/salary_register.xls"

    run "ln -nfs #{shared_path}/database.yml #{current_path}/config/database.yml"
    # run "ln -nfs #{shared_path}/mongoid.yml #{current_path}/config/mongoid.yml"

  end
end

after 'deploy:update_code' do
  run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
  # run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
end
# load 'deploy/assets'cat
#
# # set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
#
# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# # role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# # role :db,  "your slave db-server here"
#
# # if you want to clean up old releases on each deploy uncomment this:
# # after "deploy:restart", "deploy:cleanup"
#
# # if you're still using the script/reaper helper you will need
# # these http://github.com/rails/irs_process_scripts
#
# # If you are using Passenger mod_rails uncomment this:
# # namespace :deploy do
# #   task :start do ; end
# #   task :stop do ; end
# #   task :restart, :roles => :app, :except => { :no_release => true } do
# #     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
# #   end
# # end