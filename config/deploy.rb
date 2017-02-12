# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'itinarite'
set :repo_url, 'git@bitbucket.org:alamadee/itinarite.git'

# Default branch is :master
#ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/ubuntu/itinarite'

# restart passender
set :passenger_restart_with_touch, true
# Default value for :scm is :git
set :scm, :git
# Default value for keep_releases is 5
set :keep_releases, 5
# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml','config/private_pub.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system','public/uploads')

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end