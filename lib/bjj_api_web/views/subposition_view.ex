defmodule BJJWeb.SubpositionView do
  use BJJWeb, :view
  alias BJJWeb.SubpositionView

  def render("index.json", %{subpositions: subpositions}) do
    %{data: render_many(subpositions, SubpositionView, "subposition.json")}
  end

  def render("show.json", %{subposition: subposition}) do
    %{data: render_one(subposition, SubpositionView, "subposition.json")}
  end

  def render("subposition.json", %{subposition: subposition}) do
    %{id: subposition.id,
      name: subposition.name,
      position_id: subposition.position_id,
      integer: subposition.integer}
  end
end
