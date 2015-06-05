defmodule AgileCoachCampex.OrganizerTest do
  use AgileCoachCampex.ModelCase

  alias AgileCoachCampex.Organizer

  @valid_attrs %{email: "some content", name: "some content", phone: "some content", picture_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Organizer.changeset(%Organizer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Organizer.changeset(%Organizer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
