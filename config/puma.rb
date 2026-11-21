# Number of threads per worker
threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)
threads threads_count, threads_count

# Bind to Heroku's assigned port
port ENV.fetch("PORT", 3000)

# Set the environment
environment ENV.fetch("RAILS_ENV", "production")

# Number of worker processes
workers ENV.fetch("WEB_CONCURRENCY", 1)

# Preload Rails application
preload_app!
