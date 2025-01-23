max_threads_count = ENV.fetch("RAILS_MAX_THREADS", 5).to_i
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }.to_i
threads min_threads_count, max_threads_count

worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

port ENV.fetch("PORT", 3000)
environment ENV.fetch("RAILS_ENV", "development")

pidfile ENV.fetch("PIDFILE", "tmp/pids/server.pid")

workers ENV.fetch("WEB_CONCURRENCY", 2).to_i
preload_app!

plugin :tmp_restart

rails_root = File.expand_path("..", __dir__)
bind "unix://#{rails_root}/tmp/sockets/puma.sock"

if ENV.fetch("RAILS_ENV", "development") == "production"
  pidfile File.join(rails_root, "tmp", "pids", "puma.pid")
  state_path File.join(rails_root, "tmp", "pids", "puma.state")
  stdout_redirect(
    File.join(rails_root, "log", "puma.log"),
    File.join(rails_root, "log", "puma-error.log"),
    true
  )
end
