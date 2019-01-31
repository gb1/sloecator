defmodule Sloecator.LocationsTest do
  use SloecatorWeb.ConnCase
  alias Sloecator.Repo
  alias Sloecator.Location
  alias Sloecator.Locations

  test "find some locations" do

    point = %Geo.Point{coordinates: {-87.9079503, 43.0384303}, srid: 4326}

    results = Locations.within({-87.9079503, 43.0384303}, 40000000000)
    # |> Restaurant.order_by_nearest(point)
    # |> Restaurant.select_with_distance(point)
    # |> Repo.all

    assert results == []
    assert 1 == 2

  end


end
