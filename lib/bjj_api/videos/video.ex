defmodule BJJ.Videos.Video do
  use Ecto.Schema
  import Ecto.Changeset

  schema "videos" do
    field :description, :string
    field :gi, :boolean, default: false
    belongs_to(:technique, BJJ.Techniques.Technique)
    field :thumbnail, :string
    field :title, :string
    field :url, :string

  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, [:url, :thumbnail, :title, :description, :gi])
    |> validate_required([:url, :thumbnail, :title, :description, :gi])
  end
end
