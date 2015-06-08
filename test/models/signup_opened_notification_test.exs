defmodule AgileCoachCampex.SignupOpenedNotificationTest do
  use AgileCoachCampex.ModelCase

  alias AgileCoachCampex.SignupOpenedNotification

  @valid_attrs %{email: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SignupOpenedNotification.changeset(%SignupOpenedNotification{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SignupOpenedNotification.changeset(%SignupOpenedNotification{}, @invalid_attrs)
    refute changeset.valid?
  end
end
