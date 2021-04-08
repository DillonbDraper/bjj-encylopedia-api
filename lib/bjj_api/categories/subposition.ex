defmodule BJJ.Categories.Subposition do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subpositions" do
    field :name, :string
    belongs_to(:position, BJJ.Categories.Position)

  end

  @doc false
  def changeset(subposition, attrs) do
    subposition
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
