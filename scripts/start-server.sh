brunch build --production
mix phoenix.digest
mix ecto.create                                                              
mix ecto.migrate
mix phoenix.server