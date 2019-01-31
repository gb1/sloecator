# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Sloecator.Repo.insert!(%Sloecator.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

locations = [
  %Sloecator.Location{
    image: "ok", user: "gb", description: "radders", point: %Geo.Point{coordinates: {-1.034344, 52.943410}, srid: 4326}},
  %Sloecator.Location{
    image: "ok", user: "gb", description: "wezzie-burito", point: %Geo.Point{coordinates: {-1.134017, 52.935673}, srid: 4326}},
  %Sloecator.Location{
    image: "ok", user: "gb", description: "bingham", point: %Geo.Point{coordinates: {-0.956144, 52.951088}, srid: 4326}}
]


Enum.each(locations, fn(location) ->
  location |> Sloecator.Repo.insert!
end)

IO.puts "done!"
