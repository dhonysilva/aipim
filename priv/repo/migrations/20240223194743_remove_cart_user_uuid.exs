# mix ecto.gen.migration add_cart_user_id
defmodule Aipim.Repo.Migrations.AddCartUserId do
  use Ecto.Migration

  def change do
    alter table(:carts) do
      remove :user_uuid
    end
  end
end
