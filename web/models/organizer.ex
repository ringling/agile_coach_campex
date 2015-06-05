defmodule AgileCoachCampex.Organizer do
  use AgileCoachCampex.Web, :model

  schema "organizers" do
    field :name, :string
    field :email, :string
    field :phone, :string
    field :picture_url, :string

    timestamps
  end

  @required_fields ~w(name email phone picture_url)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
