ExUnit.start

# Create the database, run migrations, and start the test transaction.
Mix.Task.run "ecto.create", ["--quiet"]
Mix.Task.run "ecto.migrate", ["--quiet"]
Ecto.Adapters.SQL.begin_test_transaction(AgileCoachCampex.Repo)
{:ok, _} = Mailman.TestServer.start

defmodule Plug.ProcessStore do
  @behaviour Plug.Session.Store

  def init(_opts) do
    nil
  end

  def get(_conn, sid, nil) do
    {sid, Process.get({:session, sid}) || %{}}
  end

  def delete(_conn, sid, nil) do
    Process.delete({:session, sid})
    :ok
  end

  def put(conn, nil, data, nil) do
    sid = :crypto.strong_rand_bytes(96) |> Base.encode64
    put(conn, sid, data, nil)
  end

  def put(_conn, sid, data, nil) do
    Process.put({:session, sid}, data)
    sid
  end
end


defmodule Authenticator do
  def init(options), do: options

  def call(conn, options) do
    authenticate(conn, options)
  end

  defp authenticate(conn, _) do
    conn
  end
end