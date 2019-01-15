# ECB Server Test

To start the ECB server:
  * Install asdf version manager, follow the instructions [here](https://github.com/asdf-vm/asdf)
  * Install asdf `plugins` elixir 1.8.0 and erlang 21.2.2
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
    If you do not have PostgreSQL, install it first
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
