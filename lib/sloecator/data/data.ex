defmodule Sloecator.Data do
  @moduledoc """
  The Data context.
  """

  import Ecto.Query, warn: false
  alias Sloecator.Repo

  alias Sloecator.Data.Spot

  @doc """
  Returns the list of spots.

  ## Examples

      iex> list_spots()
      [%Spot{}, ...]

  """
  def list_spots do
    Repo.all(Spot)
  end

  @doc """
  Gets a single spot.

  Raises `Ecto.NoResultsError` if the Spot does not exist.

  ## Examples

      iex> get_spot!(123)
      %Spot{}

      iex> get_spot!(456)
      ** (Ecto.NoResultsError)

  """
  def get_spot!(id), do: Repo.get!(Spot, id)

  @doc """
  Creates a spot.

  ## Examples

      iex> create_spot(%{field: value})
      {:ok, %Spot{}}

      iex> create_spot(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_spot(attrs \\ %{}) do
    %Spot{}
    |> Spot.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a spot.

  ## Examples

      iex> update_spot(spot, %{field: new_value})
      {:ok, %Spot{}}

      iex> update_spot(spot, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_spot(%Spot{} = spot, attrs) do
    spot
    |> Spot.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Spot.

  ## Examples

      iex> delete_spot(spot)
      {:ok, %Spot{}}

      iex> delete_spot(spot)
      {:error, %Ecto.Changeset{}}

  """
  def delete_spot(%Spot{} = spot) do
    Repo.delete(spot)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking spot changes.

  ## Examples

      iex> change_spot(spot)
      %Ecto.Changeset{source: %Spot{}}

  """
  def change_spot(%Spot{} = spot) do
    Spot.changeset(spot, %{})
  end
end
