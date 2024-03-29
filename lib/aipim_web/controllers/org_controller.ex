defmodule AipimWeb.OrgController do
  use AipimWeb, :controller

  alias Aipim.Organizations
  alias Aipim.Organizations.Org

  def index(conn, _params) do
    orgs = Organizations.list_orgs()
    render(conn, :index, orgs: orgs)
  end

  def new(conn, _params) do
    changeset = Organizations.change_org(%Org{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"org" => org_params}) do
    case Organizations.create_org(org_params) do
      {:ok, org} ->
        conn
        |> put_flash(:info, "Org created successfully.")
        |> redirect(to: ~p"/orgs/#{org}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    org = Organizations.get_org!(id)
    render(conn, :show, org: org)
  end

  def edit(conn, %{"id" => id}) do
    org = Organizations.get_org!(id)
    changeset = Organizations.change_org(org)
    render(conn, :edit, org: org, changeset: changeset)
  end

  def update(conn, %{"id" => id, "org" => org_params}) do
    org = Organizations.get_org!(id)

    case Organizations.update_org(org, org_params) do
      {:ok, org} ->
        conn
        |> put_flash(:info, "Org updated successfully.")
        |> redirect(to: ~p"/orgs/#{org}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, org: org, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    org = Organizations.get_org!(id)
    {:ok, _org} = Organizations.delete_org(org)

    conn
    |> put_flash(:info, "Org deleted successfully.")
    |> redirect(to: ~p"/orgs")
  end
end
