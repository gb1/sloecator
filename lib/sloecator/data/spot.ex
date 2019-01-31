defmodule Sloecator.Data.Spot do
  use Ecto.Schema
  import Ecto.Changeset
  alias Sloecator.Data.Spot
  use Arc.Ecto.Schema


  schema "spots" do
    field :description, :string
    field :filename, Sloecator.ImageFile.Type
    field :point, Geo.PostGIS.Geometry
    field :tag, :string

    timestamps()
  end

  @doc false
  def changeset(spot, attrs) do
    spot
    |> cast(attrs, [:tag, :description, :filename, :point])
    |> cast_attachments(attrs, [:filename])
    |> validate_required([:description, :filename])
  end
end
