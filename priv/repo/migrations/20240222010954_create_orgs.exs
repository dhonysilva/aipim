# mix phx.gen.html Organizations Org orgs name:string slug:string

defmodule Aipim.Repo.Migrations.CreateOrgs do
  use Ecto.Migration

  def change do
    create table(:orgs, primary_key: false) do
      add :org_id, :bigserial, primary_key: true
      add :name, :string
      add :slug, :string

      timestamps(type: :utc_datetime)
    end
  end
end
