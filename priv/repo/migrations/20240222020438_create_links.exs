# mix phx.gen.html Links Link links url:string visits:integer org_id:references:orgs

defmodule Aipim.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :url, :string
      add :visits, :integer
      add :org_id, references(:orgs, column: :org_id, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:links, [:org_id])
  end
end
