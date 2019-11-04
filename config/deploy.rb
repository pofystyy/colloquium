lock "~> 3.11.1"

# Main settings
set :application,             'app'
set :branch,                  :master
set :deploy_to,               '/home/deploy/app'
set :pty,                     true
set :use_sudo,                true
set :migration_role,          :app
set :assets_roles,            [:web, :app]
set :rails_env,               :production
set :rvm_ruby_version,        'ruby-2.3.6'
set :linked_files,            %w{config/master.key}

# Puma settings
set :puma_threads,            [0, 8]
set :puma_workers,            0
set :puma_bind,               "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,              "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,                "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log,         "#{release_path}/log/puma.error.log"
set :puma_error_log,          "#{release_path}/log/puma.access.log"
set :puma_preload_app,        true
set :puma_worker_timeout,     nil
# set :puma_init_active_record, true # Change to false when not using ActiveRecord

# Sidekiq settings
# set :sidekiq_roles,            :app
# set :sidekiq_config,          "#{current_path}/config/sidekiq.yml"

## Linked Files & Directories (Default None):
set :linked_dirs, %w(log tmp/pids)
set :linked_files, %w(config/master.key)

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts 'WARNING: HEAD is not the same as origin/master'
        puts 'Run `git push` to sync changes.'
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke('puma:restart')
    end
  end

  # desc 'Restart sidekiq'
  # task :restart_sidekiq do
  #   on roles(:app) do
  #     execute :sudo, :systemctl, :restart, :sidekiq
  #   end
  # end

  # desc 'Runs rake db:seed'
  # task :seed => [:set_rails_env] do
  #   on primary fetch(:migration_role) do
  #     within release_path do
  #       with rails_env: fetch(:rails_env) do
  #         execute :rake, 'db:seed'
  #       end
  #     end
  #   end
  # end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma
