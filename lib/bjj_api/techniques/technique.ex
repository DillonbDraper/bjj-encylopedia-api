defmodule BJJ.Techniques.Technique do
  use Ecto.Schema
  import Ecto.Changeset

  schema "techniques" do
    field :name, :string
    belongs_to(:position, BJJ.Categories.Position)
    belongs_to(:subposition, BJJ.Categories.Subposition)
    belongs_to(:orientation, BJJ.Categories.Orientation)

  end

  @doc false
  def changeset(technique, attrs) do
    technique
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
