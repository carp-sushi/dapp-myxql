import Config

# When running in prod, read database URL, connection pool size and schema from environment variables.
if config_env() == :prod do
  db_url = System.get_env("DB_URL") || raise "DB_URL not defined. Example: ecto://USER:PASS@HOST:PORT/DB"
  db_pool_size = System.get_env("DB_POOL_SIZE") || "10"

  # Verify network prefix has been set correctly
  if System.get_env("NETWORK_PREFIX") not in ["tp", "pb"] do
    raise "NETWORK_PREFIX must be set to \"tp\" or \"pb\""
  end

  config :dapp, Dapp.Repo,
    url: db_url,
    pool_size: String.to_integer(db_pool_size)
end
