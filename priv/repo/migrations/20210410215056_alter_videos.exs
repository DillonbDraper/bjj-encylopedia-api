defmodule BJJ.Repo.Migrations.AlterVideos do
  use Ecto.Migration

  def change do
    alter table(:videos) do
      modify :description, :text
    end
  end
end
