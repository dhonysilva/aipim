# mix phx.gen.html Catalog Product products title:string description:string price:decimal views:integer
defmodule Aipim.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string
      add :description, :string
      add :price, :decimal
      add :views, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
