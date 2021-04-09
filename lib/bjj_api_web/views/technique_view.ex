defmodule BJJWeb.TechniqueView do
  use BJJWeb, :view
  alias BJJWeb.TechniqueView

  def render("index.json", %{techniques: techniques}) do
    %{data: render_many(techniques, TechniqueView, "technique.json")}
  end

  def render("show.json", %{technique: technique}) do
    %{data: render_one(technique, TechniqueView, "technique.json")}
  end

  def render("technique.json", %{technique: technique}) do
    %{id: technique.id,
      name: technique.name,
      position_id: technique.position_id,
      subposition_id: technique.subposition_id,
      orientation_id: technique.orientation_id

    }
  end
end
