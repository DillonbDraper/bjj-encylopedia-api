defmodule BJJWeb.NoteView do
  use BJJWeb, :view
  alias BJJWeb.NoteView

  def render("index.json", %{notes: notes}) do
    %{data: render_many(notes, NoteView, "note.json")}
  end

  def render("show.json", %{note: note}) do
    %{data: render_one(note, NoteView, "note.json")}
  end

  def render("note.json", %{note: note}) do
    %{id: note.id,
      text: note.text,
      time: note.time,
      user_id: note.user_id,
      video_id: note.video_id}
  end
end
