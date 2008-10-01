set :application, "sandwiches"
set :repository,  "git@github.com:Floppy/sandwiches.git"

set :deploy_to, "/var/www/s.andwi.ch"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, "git"
set :user, "root"

role :app, "67.207.134.233"#"s.andwi.ch"
role :web, "67.207.134.233"#"s.andwi.ch"
role :db,  "67.207.134.233", :primary => true#"s.andwi.ch", :primary => true

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end
