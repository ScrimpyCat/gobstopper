use Mix.Config

# Print only warnings and errors during test
config :logger, level: :warn

# Configure database
config :gobstopper_service, Gobstopper.Service.Repo,
    adapter: Ecto.Adapters.Postgres,
    username: "postgres",
    password: "postgres",
    database: "gobstopper_service_test",
    hostname: "localhost",
    pool: Ecto.Adapters.SQL.Sandbox

config :guardian, Guardian,
    allowed_algos: ["HS512"],
    verify_module: Guardian.JWT,
    issuer: "Gobstopper.Service",
    ttl: { 30, :days },
    allowed_drift: 2000,
    verify_issuer: true,
    secret_key: "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.e30.6bK5p0FPG1KY68mstRXiUjWtti5EbPmDg0QxP702j3WTEcI16GXZAU0NlXMQFnyPsrDyqCv9p6KRqMg7LcswMg",
    serializer: Gobstopper.Service.GuardianSerializer,
    hooks: GuardianDb

import_config "../../../deps/sherbet_service/apps/sherbet_service/config/config.exs"
