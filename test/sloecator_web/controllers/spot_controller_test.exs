defmodule SloecatorWeb.SpotControllerTest do
  use SloecatorWeb.ConnCase

  alias Sloecator.Data

  @create_attrs %{description: "some description", filename: "some filename", point: "some point", tag: "some tag"}
  @update_attrs %{description: "some updated description", filename: "some updated filename", point: "some updated point", tag: "some updated tag"}
  @invalid_attrs %{description: nil, filename: nil, point: nil, tag: nil}

  def fixture(:spot) do
    {:ok, spot} = Data.create_spot(@create_attrs)
    spot
  end

  describe "index" do
    test "lists all spots", %{conn: conn} do
      conn = get conn, spot_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Spots"
    end
  end

  describe "new spot" do
    test "renders form", %{conn: conn} do
      conn = get conn, spot_path(conn, :new)
      assert html_response(conn, 200) =~ "New Spot"
    end
  end

  describe "create spot" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, spot_path(conn, :create), spot: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == spot_path(conn, :show, id)

      conn = get conn, spot_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Spot"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, spot_path(conn, :create), spot: @invalid_attrs
      assert html_response(conn, 200) =~ "New Spot"
    end
  end

  describe "edit spot" do
    setup [:create_spot]

    test "renders form for editing chosen spot", %{conn: conn, spot: spot} do
      conn = get conn, spot_path(conn, :edit, spot)
      assert html_response(conn, 200) =~ "Edit Spot"
    end
  end

  describe "update spot" do
    setup [:create_spot]

    test "redirects when data is valid", %{conn: conn, spot: spot} do
      conn = put conn, spot_path(conn, :update, spot), spot: @update_attrs
      assert redirected_to(conn) == spot_path(conn, :show, spot)

      conn = get conn, spot_path(conn, :show, spot)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, spot: spot} do
      conn = put conn, spot_path(conn, :update, spot), spot: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Spot"
    end
  end

  describe "delete spot" do
    setup [:create_spot]

    test "deletes chosen spot", %{conn: conn, spot: spot} do
      conn = delete conn, spot_path(conn, :delete, spot)
      assert redirected_to(conn) == spot_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, spot_path(conn, :show, spot)
      end
    end
  end

  defp create_spot(_) do
    spot = fixture(:spot)
    {:ok, spot: spot}
  end
end
