defmodule BJJWeb.SubpositionController do
  use BJJWeb, :controller

  alias BJJ.Categories
  alias BJJ.Categories.Subposition

  action_fallback BJJWeb.FallbackController

  def index(conn, _params) do
    subpositions = Categories.list_subpositions()
    render(conn, "index.json", subpositions: subpositions)
  end

  def create(conn, %{"subposition" => subposition_params}) do
    with {:ok, %Subposition{} = subposition} <- Categories.create_subposition(subposition_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.subposition_path(conn, :show, subposition))
      |> render("show.json", subposition: subposition)
    end
  end

  def show(conn, %{"id" => id}) do
    subposition = Categories.get_subposition!(id)
    render(conn, "show.json", subposition: subposition)
  end

  def update(conn, %{"id" => id, "subposition" => subposition_params}) do
    subposition = Categories.get_subposition!(id)

    with {:ok, %Subposition{} = subposition} <- Categories.update_subposition(subposition, subposition_params) do
      render(conn, "show.json", subposition: subposition)
    end
  end

  def delete(conn, %{"id" => id}) do
    subposition = Categories.get_subposition!(id)

    with {:ok, %Subposition{}} <- Categories.delete_subposition(subposition) do
      send_resp(conn, :no_content, "")
    end
  end
end
