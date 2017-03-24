# Bamboo.SendcloudAdapter

A [Sendcloud](https://www.sendcloud.net) adapter for the [Bamboo](https://github.com/thoughtbot/bamboo).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bamboo_sendcloud` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:bamboo_sendcloud, "~> 0.1.0"}]
end
```

In `config/config.exs`, or `config.prod.exs`, etc.

```elixir
config :my_app, MyApp.Mailer,
  adapter: Bamboo.SendcloudAdapter,
  api_user: "my_api_user",
  api_key: "my_api_key"
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bamboo_sendcloud](https://hexdocs.pm/bamboo_sendcloud).

