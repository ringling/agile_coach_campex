defmodule SignupOpenNotificationMailTest do
  use ExUnit.Case, async: true

  @test_email_adr "test@test.org"

  test "mail_to is set" do
    assert SignupOpenNotificationMail.mail(@test_email_adr).to == [@test_email_adr]
  end

end