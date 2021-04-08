defmodule BJJ.Repo.Migrations.CreateSubpositions do
  use Ecto.Migration

  def change do
    create table(:subpositions) do
      add :name, :string
      add :position_id, :integer

    end

  end
end
