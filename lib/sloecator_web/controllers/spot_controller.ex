defmodule SloecatorWeb.SpotController do
  use SloecatorWeb, :controller

  alias Sloecator.Data
  alias Sloecator.Data.Spot

  require IEx

  def index(conn, %{"lat" => lat_str, "lng" => lng_str }) do

    {lat, ""} = Float.parse(lat_str)
    {lng, ""} = Float.parse(lng_str)

    point = %Geo.Point{coordinates: {lng, lat}, srid: 4326}

    # conn = conn |> assign("lat", lat_str)
    # conn = assign(conn, :hello, :world)

    conn = put_session(conn, :message, "new stuff we just set in the session")

    spots = Data.list_spots()
    render(conn, "index.html", spots: spots)
  end

  def index(conn, param) do

    IEx.pry
    get_session(conn, :message)

    spots = Data.list_spots()
    render(conn, "index.html", spots: spots)
  end

  def new(conn, _params) do
    changeset = Data.change_spot(%Spot{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"spot" => spot_params}) do
    case Data.create_spot(spot_params) do
      {:ok, spot} ->
        conn
        |> put_flash(:info, "Spot created successfully.")
        |> redirect(to: spot_path(conn, :show, spot))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    IEx.pry
    spot = Data.get_spot!(id)
    render(conn, "show.html", spot: spot)
  end

  def edit(conn, %{"id" => id}) do
    spot = Data.get_spot!(id)
    changeset = Data.change_spot(spot)
    render(conn, "edit.html", spot: spot, changeset: changeset)
  end

  def update(conn, %{"id" => id, "spot" => spot_params}) do
    spot = Data.get_spot!(id)

    case Data.update_spot(spot, spot_params) do
      {:ok, spot} ->
        conn
        |> put_flash(:info, "Spot updated successfully.")
        |> redirect(to: spot_path(conn, :show, spot))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", spot: spot, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    spot = Data.get_spot!(id)
    {:ok, _spot} = Data.delete_spot(spot)

    conn
    |> put_flash(:info, "Spot deleted successfully.")
    |> redirect(to: spot_path(conn, :index))
  end
end
