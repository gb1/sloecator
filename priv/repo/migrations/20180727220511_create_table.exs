defmodule Sloecator.Repo.Migrations.CreateTable do
  use Ecto.Migration

  def change do
  end

  def up do
    execute "CREATE EXTENSION IF NOT EXISTS postgis"
    create table(:locations) do
      add :description, :string
      add :user, :string
      add :image, :string
      timestamps
    end

    # Add a field `point` with type `geometry(Point,4326)`.
    # This can store a "standard GPS" (epsg4326) coordinate pair {longitude,latitude}.
    # execute("SELECT AddGeometryColumn ('locations','point',4326,'POINT',2)")
    execute("SELECT AddGeometryColumn ('locations','point',4326,'POINT',2);")
    execute("CREATE INDEX locations_point_index on locations USING gist (point)")
  end

  def down do
    drop table(:locations)
    execute "DROP EXTENSION IF EXISTS postgis"
  end

end
