defmodule BJJWeb.OrientationView do
  use BJJWeb, :view
  alias BJJWeb.OrientationView

  def render("index.json", %{orientations: orientations}) do
    %{data: render_many(orientations, OrientationView, "orientation.json")}
  end

  def render("show.json", %{orientation: orientation}) do
    %{data: render_one(orientation, OrientationView, "orientation.json")}
  end

  def render("orientation.json", %{orientation: orientation}) do
    %{id: orientation.id,
      dominant: orientation.dominant}
  end
end
