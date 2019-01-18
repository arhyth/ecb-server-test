# ECB Server Test

To start the ECB server:
  <br />
  If you do not have Elixir and Erlang
  * Install asdf version manager, follow the instructions [here](https://github.com/asdf-vm/asdf)
  * Install elixir and erlang asdf plugins, latest versions are `1.8`, and `21.2.2` respectively

  If you do not have the Phoenix web framework
  * Install archive image in your `projects` directory
    ```
    mix archive.install hex phx_new 1.4.0
    ```
    For more detailed help, check phoenix installation [docs](https://hexdocs.pm/phoenix/installation.html)
    
If you do not have PostgreSQL, install it first
  * check specific installation for your OS

Proceed with other dependencies
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`

## Start Phoenix
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Coverage
  * run `mix coveralls` or `mix coveralls.html` in your ECB clone directory
