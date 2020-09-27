use Mix.Config

config :nostrum,
  token: System.get_env("BOT_TOKEN") || "",
  num_shards: :auto

config :logger,
  level: System.get_env("DEBUG", "false") == "true" && :debug || :info
