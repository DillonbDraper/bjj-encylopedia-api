defmodule BJJ.Repo.Migrations.CreateTechniques do
  use Ecto.Migration

  def change do
    create table(:techniques) do
      add :name, :string
      add :position_id, :integer
      add :subposition_id, :integer
      add :orientation_id, :integer


    end

  end
end
