defmodule Aipim.Accounts.Org do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:org_id, :id, autogenerate: true}

  # What @derive does here?
  # In Elixir, a protocol defines an API and its specific implementations.
  # Phoenix.Param is a protocol used to convert data structures into URL parameters.
  # By default, this protocol is used for integers, binaries, atoms, and structs.
  # The default key :id is usually used for structs, but it's possible to define other parameters.

  # For our case, we're using org_id parameter as the orgs primary key's table.

  # Usefull docs links:

  # https://hexdocs.pm/phoenix/Phoenix.Param.html
  # https://hexdocs.pm/elixir/1.14/Protocol.html
  # https://blog.appsignal.com/2023/12/05/advanced-multi-tenancy-for-elixir-applications-using-ecto.html

  @derive {Phoenix.Param, key: :org_id}

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
