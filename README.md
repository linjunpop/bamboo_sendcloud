# Bamboo.SendcloudAdapter

A [Sendcloud](https://www.sendcloud.net) adapter for the [Bamboo](https://github.com/thoughtbot/bamboo).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bamboo_sendcloud` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:bamboo_sendcloud, "~> 0.2.0"}]
end
```

In `config/config.exs`, or `config.prod.exs`, etc.

```elixir
config :my_app, MyApp.Mailer,
  adapter: Bamboo.SendcloudAdapter,
  api_user: "my_api_user",
  api_key: "my_api_key"
```

## Usage

### Send standard email

```elixir
import Bamboo.Email

email =
  new_email()
  |> from({"Bender", "notify@send1.example.com"})
  |> to(user)
  |> subject("Welcome!")
  |> text_body("Welcome to the app")
  |> html_body("<strong>Welcome to the app</strong>")
```

### Send template email

```elixir
import Bamboo.Email

email =
  new_email()
  |> from({"Bender", "notify@send1.example.com"})
  |> to(user)
  |> SendcloudHelper.template("reset_password", %{"%link%" => [reset_password_link]})
```

## Docs

[https://hexdocs.pm/bamboo_sendcloud](https://hexdocs.pm/bamboo_sendcloud).

