defmodule Sloecator.DataTest do
  use Sloecator.DataCase

  alias Sloecator.Data

  describe "spots" do
    alias Sloecator.Data.Spot

    @valid_attrs %{description: "some description", filename: "some filename", point: "some point", tag: "some tag"}
    @update_attrs %{description: "some updated description", filename: "some updated filename", point: "some updated point", tag: "some updated tag"}
    @invalid_attrs %{description: nil, filename: nil, point: nil, tag: nil}

    def spot_fixture(attrs \\ %{}) do
      {:ok, spot} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_spot()

      spot
    end

    test "list_spots/0 returns all spots" do
      spot = spot_fixture()
      assert Data.list_spots() == [spot]
    end

    test "get_spot!/1 returns the spot with given id" do
      spot = spot_fixture()
      assert Data.get_spot!(spot.id) == spot
    end

    test "create_spot/1 with valid data creates a spot" do
      assert {:ok, %Spot{} = spot} = Data.create_spot(@valid_attrs)
      assert spot.description == "some description"
      assert spot.filename == "some filename"
      assert spot.point == "some point"
      assert spot.tag == "some tag"
    end

    test "create_spot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_spot(@invalid_attrs)
    end

    test "update_spot/2 with valid data updates the spot" do
      spot = spot_fixture()
      assert {:ok, spot} = Data.update_spot(spot, @update_attrs)
      assert %Spot{} = spot
      assert spot.description == "some updated description"
      assert spot.filename == "some updated filename"
      assert spot.point == "some updated point"
      assert spot.tag == "some updated tag"
    end

    test "update_spot/2 with invalid data returns error changeset" do
      spot = spot_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_spot(spot, @invalid_attrs)
      assert spot == Data.get_spot!(spot.id)
    end

    test "delete_spot/1 deletes the spot" do
      spot = spot_fixture()
      assert {:ok, %Spot{}} = Data.delete_spot(spot)
      assert_raise Ecto.NoResultsError, fn -> Data.get_spot!(spot.id) end
    end

    test "change_spot/1 returns a spot changeset" do
      spot = spot_fixture()
      assert %Ecto.Changeset{} = Data.change_spot(spot)
    end
  end
end
