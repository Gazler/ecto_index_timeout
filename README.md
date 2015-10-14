EctoCrash
=========

This applications shows how Ecto can crash on a unique index when using an umbrella application.

There are two applications:

1. `first_app` - contains the migrations, an Ecto repo, an Ecto model and a single test
2. `second_app` - contains a different Ecto repo and a single test that uses the Ecto model from `first_app`

## Running

1. clone the repo
2. `cd apps/first_apps`
3. `mix ecto.create`
3. `mix ecto.migrate`
4. `cd ../../`
5. `mix test`

Or a one-liner: `cd apps/first_apps && mix do ecto.create, ecto.migrate && cd../../ && mix test`

The 2nd app should crash with:

>  1) test creating a user (SecondAppTest)
>   test/second_app_test.exs:4
>   ** (exit) exited in: GenServer.call(#PID<0.179.0>, {:query, "INSERT INTO \"users\" (\"name\") VALUES ($1) RETURNING \"id\"", ["foo"]}, 5000)
>       ** (EXIT) time out
>   stacktrace:
>     (elixir) lib/gen_server.ex:356: GenServer.call/3
>     (postgrex) lib/postgrex/connection.ex:102: Postgrex.Connection.query/4
>     (ecto) lib/ecto/adapters/postgres/connection.ex:31: Ecto.Adapters.Postgres.Connection.query/4
>     (stdlib) timer.erl:194: :timer.tc/3
>     (ecto) lib/ecto/adapters/sql.ex:246: Ecto.Adapters.SQL.query/7
>     (ecto) lib/ecto/pool.ex:159: Ecto.Pool.do_run/4
>     (ecto) lib/ecto/adapters/sql.ex:231: Ecto.Adapters.SQL.query/6
>     (ecto) lib/ecto/adapters/sql.ex:209: Ecto.Adapters.SQL.query/5

Removing the unique index on the column in the migration and re-running it will prevent the issue.
