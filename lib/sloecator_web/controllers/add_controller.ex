defmodule SloecatorWeb.AddController do
  use SloecatorWeb, :controller
  alias Sloecator.Location
  alias Sloecator.Repo

  require IEx


  def index(conn, _params) do

    changeset = Location.changeset(%Location{}, %{})
    render(conn, "index.html", changeset: changeset)
  end

  def upload(conn, %{"location" => location_params}) do

    IEx.pry

    %Location{}
    |> Location.changeset(location_params)
    |> Repo.insert()

    text(conn, "piggy")
  end

end
