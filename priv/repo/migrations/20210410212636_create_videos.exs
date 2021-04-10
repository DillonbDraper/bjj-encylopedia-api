defmodule BJJ.Repo.Migrations.CreateVideos do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :url, :string
      add :thumbnail, :string
      add :title, :string
      add :description, :string
      add :technique_id, :integer
      add :gi, :boolean, default: false, null: false

    end

  end
end
