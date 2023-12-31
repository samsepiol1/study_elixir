# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sampler,
  ecto_repos: [Sampler.Repo]

# Configures the endpoint
config :sampler, SamplerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Qst9LLPYDtg+nu1qOl6sqlC92/VeoWeer5hztHRlx/DfMQ4L1BWd5IvmuUUfRtiD",
  render_errors: [view: SamplerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Sampler.PubSub,
  live_view: [signing_salt: "ElG8eqec"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
