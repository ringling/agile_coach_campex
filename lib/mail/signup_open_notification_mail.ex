defmodule SignupOpenNotificationMail do

  def mail(to) do
    %Mailman.Email{
      subject: "Agile Coach Camp 2016 - notification",
      from: Settings.Mail.from,
      to: [to],
      data: [name: to],
      text: "Agile Coach Camp 2016\nYou will now be notified when the sign-up opens :)",
      html: """
        <html>
        <body>
          <h1>Agile Coach Camp 2016</h1>
          You will now be notified when the sign-up opens :)
        </body>
        </html>
      """
      }
  end

end
