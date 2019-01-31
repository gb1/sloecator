defmodule Sloecator.Repo.Migrations.CreateSpots do
  use Ecto.Migration

  def change do
    create table(:spots) do
      add :tag, :string
      add :description, :string
      add :filename, :string
      add :point, :string

      timestamps()
    end

  end
end
