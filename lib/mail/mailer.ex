defmodule AgileCoachCampex.Mailer do

  def deliver(email) do
    Mailman.deliver(email, config)
  end

  def config do
    %Mailman.Context{
        config:   %Mailman.SmtpConfig{ 
          relay: Settings.Mail.smtp_relay, 
          username: Settings.Mail.mailchimp_username,
          password: Settings.Mail.mailchimp_password,
          port: Settings.Mail.smtp_port           
        },
        composer: %Mailman.EexComposeConfig{}
      }
  end 

end







