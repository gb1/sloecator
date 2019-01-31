defmodule SloecatorWeb.LocationsController do
  use SloecatorWeb, :controller
  alias Sloecator.Locations
  require IEx


  def index(conn, params) do

    %{"lat" => lat_str, "lng" => lng_str } = params

    {lat, ""} = Float.parse(lat_str)
    {lng, ""} = Float.parse(lng_str)

    point = %Geo.Point{coordinates: {lng, lat}, srid: 4326}

    locations = point
    |> Locations.within(10000)
    |> Locations.order_by_nearest(point)
    |> Locations.select_with_distance(point)
    |> Sloecator.Repo.all

    render conn, "index.html", locations: locations
  end
end
