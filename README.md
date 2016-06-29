# Nosy
Nosy wants to know what you've been up to.

## To run
Copy the `recognized_tokens.sample` file in `config` to just `recognized_tokens`. Populate it with the tokens you want, it's gitignored anyway.

Set a bunch of env variables in your dot files.
 - `NOSY_ACCESS_KEY`: Access key to add and view tokens.
 - `DATABASE_URL`: Postgres server address, format in *environments.rb*
 - `PG_USER`, `PG_PASS`: To access the postgres server

Migrate and seed.

TODO: Test cases for everything

