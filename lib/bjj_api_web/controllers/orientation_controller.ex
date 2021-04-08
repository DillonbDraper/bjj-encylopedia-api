defmodule BJJWeb.OrientationController do
  use BJJWeb, :controller

  alias BJJ.Categories
  alias BJJ.Categories.Orientation

  action_fallback BJJWeb.FallbackController

  def index(conn, _params) do
    orientations = Categories.list_orientations()
    render(conn, "index.json", orientations: orientations)
  end

  def create(conn, %{"orientation" => orientation_params}) do
    with {:ok, %Orientation{} = orientation} <- Categories.create_orientation(orientation_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.orientation_path(conn, :show, orientation))
      |> render("show.json", orientation: orientation)
    end
  end

  def show(conn, %{"id" => id}) do
    orientation = Categories.get_orientation!(id)
    render(conn, "show.json", orientation: orientation)
  end

  def update(conn, %{"id" => id, "orientation" => orientation_params}) do
    orientation = Categories.get_orientation!(id)

    with {:ok, %Orientation{} = orientation} <- Categories.update_orientation(orientation, orientation_params) do
      render(conn, "show.json", orientation: orientation)
    end
  end

  def delete(conn, %{"id" => id}) do
    orientation = Categories.get_orientation!(id)

    with {:ok, %Orientation{}} <- Categories.delete_orientation(orientation) do
      send_resp(conn, :no_content, "")
    end
  end
end
