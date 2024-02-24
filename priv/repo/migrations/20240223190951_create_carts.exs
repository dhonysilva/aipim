# mix phx.gen.context ShoppingCart Cart carts user_uuid:uuid:unique
defmodule Aipim.Repo.Migrations.CreateCarts do
  use Ecto.Migration

  def change do
    create table(:carts) do
      add :user_uuid, :uuid

      timestamps(type: :utc_datetime)
    end

    create unique_index(:carts, [:user_uuid])
  end
end
