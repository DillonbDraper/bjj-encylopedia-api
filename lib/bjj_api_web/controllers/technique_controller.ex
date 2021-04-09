defmodule BJJWeb.TechniqueController do
  use BJJWeb, :controller

  alias BJJ.Techniques
  alias BJJ.Techniques.Technique

  action_fallback BJJWeb.FallbackController

  def index(conn, _params) do
    techniques = Techniques.list_techniques()
    render(conn, "index.json", techniques: techniques)
  end

  def create(conn, %{"technique" => technique_params}) do
    with {:ok, %Technique{} = technique} <- Techniques.create_technique(technique_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.technique_path(conn, :show, technique))
      |> render("show.json", technique: technique)
    end
  end

  def show(conn, %{"id" => id}) do
    technique = Techniques.get_technique!(id)
    render(conn, "show.json", technique: technique)
  end

  def update(conn, %{"id" => id, "technique" => technique_params}) do
    technique = Techniques.get_technique!(id)

    with {:ok, %Technique{} = technique} <- Techniques.update_technique(technique, technique_params) do
      render(conn, "show.json", technique: technique)
    end
  end

  def delete(conn, %{"id" => id}) do
    technique = Techniques.get_technique!(id)

    with {:ok, %Technique{}} <- Techniques.delete_technique(technique) do
      send_resp(conn, :no_content, "")
    end
  end
end
