defmodule BJJ.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :text, :string
      add :time, :integer
      add :user_id, :integer
      add :video_id, :integer

    end

  end
end
