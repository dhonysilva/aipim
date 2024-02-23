defmodule Aipim.Organizations do
  @moduledoc """
  The Organizations context.
  """

  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Aipim.Repo

  alias Aipim.Organizations.Org

  @tenant_key {__MODULE__, :org_id}

  def put_org_id(org_id) do
    Process.put(@tenant_key, org_id)
  end

  def get_org_id() do
    Process.get(@tenant_key)
  end

  @doc """
  Returns the list of orgs.

  ## Examples

      iex> list_orgs()
      [%Org{}, ...]

  """
  def list_orgs(opts \\ []) do
    Repo.all(Org, opts)
  end

  @doc """
  Gets a single org.

  Raises `Ecto.NoResultsError` if the Org does not exist.

  ## Examples

      iex> get_org!(123)
      %Org{}

      iex> get_org!(456)
      ** (Ecto.NoResultsError)

  """
  def get_org!(id), do: Repo.get!(Org, id)

  @doc """
  Creates a org.

  ## Examples

      iex> create_org(%{field: value})
      {:ok, %Org{}}

      iex> create_org(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_org(attrs \\ %{}, opts \\ []) do
    %Org{}
    |> Org.changeset(attrs)
    |> Repo.insert(opts)
  end

  @doc """
  Updates a org.

  ## Examples

      iex> update_org(org, %{field: new_value})
      {:ok, %Org{}}

      iex> update_org(org, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_org(%Org{} = org, attrs) do
    org
    |> Org.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a org.

  ## Examples

      iex> delete_org(org)
      {:ok, %Org{}}

      iex> delete_org(org)
      {:error, %Ecto.Changeset{}}

  """
  def delete_org(%Org{} = org) do
    Repo.delete(org)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking org changes.

  ## Examples

      iex> change_org(org)
      %Ecto.Changeset{data: %Org{}}

  """
  def change_org(%Org{} = org, attrs \\ %{}) do
    Org.changeset(org, attrs)
  end

  def common_changeset(schema, _attrs, opts \\ []) do
    schema
    |> put_org_id(get_org_id() || opts[:org_id])
  end

  defp put_org_id(changeset, nil), do: changeset

  defp put_org_id(changeset, org_id) do
    put_change(changeset, :org_id, org_id)
  end
end
