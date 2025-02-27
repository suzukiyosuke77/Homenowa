# Puma のスレッド設定
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# 環境設定
environment ENV.fetch("RAILS_ENV") { "production" }

# ポートの設定
port ENV.fetch("PORT") { 3000 }

# マルチプロセス設定
workers ENV.fetch("WEB_CONCURRENCY") { 2 }
preload_app!

# Rails のルートディレクトリを取得
app_dir = File.expand_path("..", __dir__)

# Unix ソケットの設定
bind "unix://#{app_dir}/tmp/sockets/puma.sock"

# 本番環境用の設定
if ENV.fetch("RAILS_ENV", "development") == "production"
  pidfile File.join(app_dir, 'tmp', 'pids', 'puma.pid')
  state_path File.join(app_dir, 'tmp', 'pids', 'puma.state')
  stdout_redirect(
    File.join(app_dir, 'log', 'puma.log'),
    File.join(app_dir, 'log', 'puma-error.log'),
    true
  )
  daemonize
end

plugin :tmp_restart
