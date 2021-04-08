defmodule BJJ.Categories.Position do
  use Ecto.Schema
  import Ecto.Changeset

  schema "positions" do
    field :name, :string
    has_many(:subpositions, BJJ.Categories.Subposition)

  end

  @doc false
  def changeset(position, attrs) do
    position
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
