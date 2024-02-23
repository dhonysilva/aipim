defmodule Aipim.Links.Link do
  use Ecto.Schema
  import Ecto.Changeset

  alias Aipim.Organizations

  schema "links" do
    field :url, :string
    field :visits, :integer
    # field :org_id, :id
    belongs_to :org, Aipim.Organizations.Org, references: :org_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(link, attrs, opts \\ []) do
    link
    |> cast(attrs, [:url, :visits])
    |> Organizations.common_changeset(attrs, opts)
    |> validate_required([:url, :visits, :org_id])
  end
end
