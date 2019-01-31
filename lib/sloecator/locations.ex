defmodule Sloecator.Locations do
  import Ecto.Query, warn: false
  alias Sloecator.Repo
  alias Sloecator.Location

  def within({lng, lat}, radius_in_metres) do
    query = from(location in Location, where: fragment("ST_DWithin(?::geography, ST_SetSRID(ST_MakePoint(?, ?), ?), ?)",
      location.point, ^lng, ^lat, 4326, ^radius_in_metres))
    Repo.all(query)
  end

  def within(point, radius_in_m) do
    {lng, lat} = point.coordinates
    from(location in Location, where: fragment("ST_DWithin(?::geography, ST_SetSRID(ST_MakePoint(?, ?), ?), ?)", location.point, ^lng, ^lat, ^point.srid, ^radius_in_m))
  end

  def order_by_nearest(query, point) do
    {lng, lat} = point.coordinates
    from(location in query, order_by: fragment("? <-> ST_SetSRID(ST_MakePoint(?,?), ?)", location.point, ^lng, ^lat, ^point.srid))
  end

  def select_with_distance(query, point) do
    {lng, lat} = point.coordinates
    from(location in query,
         select: %{location | distance: fragment("ST_Distance_Sphere(?, ST_SetSRID(ST_MakePoint(?,?), ?))", location.point, ^lng, ^lat, ^point.srid)})
  end

end
