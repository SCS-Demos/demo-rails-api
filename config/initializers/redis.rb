# frozen_string_literal: true

config_redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/0') }
redis_connection = Redis.new(config_redis)
$redis_memcached_client = Redis::Namespace.new(ENV.fetch('REDIS_NAMESPACE', "flamingo-nyk-#{Rails.env}").to_sym, redis: redis_connection)
