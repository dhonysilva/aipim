defmodule Aipim.Accounts.Org do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:org_id, :id, autogenerate: true}
  schema "orgs" do
    field :name, :string
    field :slug, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(org, attrs) do
    org
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
