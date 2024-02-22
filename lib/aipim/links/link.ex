defmodule Aipim.Links.Link do
  use Ecto.Schema
  import Ecto.Changeset

  schema "links" do
    field :url, :string
    field :visits, :integer
    field :org_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:url, :visits])
    |> validate_required([:url, :visits])
  end
end
