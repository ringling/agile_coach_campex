defmodule AgileCoachCampex.Mailer do

  def deliver(email) do
    Mailman.deliver(email, config)
  end

  def config do
    %Mailman.Context{
        config:   %Mailman.SmtpConfig{ 
          relay: System.get_env["SMTP_RELAY"], 
          username: System.get_env["MAILCHIMP_USERNAME"],
          password: System.get_env["MAILCHIMP_PASSWORD"],
          port: String.to_integer(System.get_env["SMTP_PORT"])           
        },
        composer: %Mailman.EexComposeConfig{}
      }
  end 

end
