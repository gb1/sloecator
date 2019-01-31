defmodule Sloecator.Location do
  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema
  alias Sloecator.Location


  schema "locations" do
    field :image, Sloecator.ImageFile.Type
    field :user, :string
    field :description, :string
    field :point, Geo.PostGIS.Geometry
    field :distance, :float, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%Location{} = location, attrs) do
    location
    |> cast(attrs, [:description, :image, :user, :point])
    |> cast_attachments(attrs, [:image])
    |> validate_required([:description])
  end


end
