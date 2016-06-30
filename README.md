# Nosy
Nosy wants to know what you've been up to.

## To run
Copy the `recognized_tokens.sample` file in `config` to just `recognized_tokens`. Populate it with the tokens you want, it's gitignored anyway.

Set a bunch of env variables in your dot files.
 - `NOSY_ACCESS_KEY`: Access key to add and view tokens [Required even if you're deploying to Heroku].
 - `DATABASE_URL`: Postgres server address, format in *environments.rb*
 - `PG_USER`, `PG_PASS`: To access the postgres server

`bundle install` to sort dependencies. 
`rake db:migrate` `rake db:seed` Migrate and seed DB. You only need the second if you have some tokens you want to enable from the start. Otherwise, just use the API to add new tokens.

Run `app.rb` to get Sinatra to take the stage.

`bin/console` will spin up pry for debugging (might need permissions). You can use IRB by changing in file if you prefer that.

TODO: Test cases for everything

