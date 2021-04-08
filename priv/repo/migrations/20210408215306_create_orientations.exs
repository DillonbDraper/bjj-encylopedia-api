defmodule BJJ.Repo.Migrations.CreateOrientations do
  use Ecto.Migration

  def change do
    create table(:orientations) do
      add :dominant, :boolean, default: false, null: false

    end

  end
end
