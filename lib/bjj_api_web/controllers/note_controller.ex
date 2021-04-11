defmodule BJJWeb.NoteController do
  use BJJWeb, :controller

  alias BJJ.Notes
  alias BJJ.Notes.Note

  action_fallback BJJWeb.FallbackController

  def index(conn, _params) do
    if conn.query_params == %{} do

    notes = Notes.list_notes()
    render(conn, "index.json", notes: notes)
    else
      final_params = Map.new(conn.query_params, fn {k, v} -> {String.to_atom(k), v} end)

      notes = Notes.criteria_matched_notes(final_params)
      render(conn, "index.json", notes: notes)
    end
  end

  def create(conn, %{"note" => note_params}) do
    with {:ok, %Note{} = note} <- Notes.create_note(note_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.note_path(conn, :show, note))
      |> render("show.json", note: note)
    end
  end

  def show(conn, %{"id" => id}) do
    note = Notes.get_note!(id)
    render(conn, "show.json", note: note)
  end

  def update(conn, %{"id" => id, "note" => note_params}) do
    note = Notes.get_note!(id)

    with {:ok, %Note{} = note} <- Notes.update_note(note, note_params) do
      render(conn, "show.json", note: note)
    end
  end

  def delete(conn, %{"id" => id}) do
    note = Notes.get_note!(id)

    with {:ok, %Note{}} <- Notes.delete_note(note) do
      send_resp(conn, :no_content, "")
    end
  end
end
