defmodule BJJ.Categories.Orientation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orientations" do
    field :dominant, :boolean, default: false

  end

  @doc false
  def changeset(orientation, attrs) do
    orientation
    |> cast(attrs, [:dominant])
    |> validate_required([:dominant])
  end
end
