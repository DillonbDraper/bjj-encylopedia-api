defmodule BJJ.Notes.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :text, :string
    field :time, :integer
    field :user_id, :integer
    field :video_id, :integer

  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:text, :time, :user_id, :video_id])
    |> validate_required([:text, :time, :user_id, :video_id])
  end
end
