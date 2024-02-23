defmodule Aipim.ShoppingCart.Cart do
  use Ecto.Schema
  import Ecto.Changeset

  schema "carts" do
    belongs_to :user_id, Aipim.Accounts.User

    has_many :items, Aipim.ShoppingCart.CartItem

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cart, attrs) do
    cart
    |> cast(attrs, [:user_id])
    |> validate_required([:user_id])
    |> unique_constraint(:user_id)
  end
end
