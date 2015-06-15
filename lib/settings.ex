defmodule Settings do

  defmodule Admin do
    def password, do: Application.get_env(:agile_coach_campex, :admin)[:password]
  end

  defmodule Mail do
    def from, do: Application.get_env(:agile_coach_campex, :mail)[:from]
    def smtp_relay, do: Application.get_env(:agile_coach_campex, :mail)[:smtp_relay]
    def mailchimp_username, do: Application.get_env(:agile_coach_campex, :mail)[:mailchimp_username]
    def mailchimp_password, do: Application.get_env(:agile_coach_campex, :mail)[:mailchimp_password]
    def smtp_port, do: Application.get_env(:agile_coach_campex, :mail)[:smtp_port]
  end

end
