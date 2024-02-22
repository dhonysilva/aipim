defmodule Aipim.OrganizationsTest do
  use Aipim.DataCase

  alias Aipim.Organizations

  describe "orgs" do
    alias Aipim.Organizations.Org

    import Aipim.OrganizationsFixtures

    @invalid_attrs %{name: nil, slug: nil}

    test "list_orgs/0 returns all orgs" do
      org = org_fixture()
      assert Organizations.list_orgs() == [org]
    end

    test "get_org!/1 returns the org with given id" do
      org = org_fixture()
      assert Organizations.get_org!(org.id) == org
    end

    test "create_org/1 with valid data creates a org" do
      valid_attrs = %{name: "some name", slug: "some slug"}

      assert {:ok, %Org{} = org} = Organizations.create_org(valid_attrs)
      assert org.name == "some name"
      assert org.slug == "some slug"
    end

    test "create_org/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_org(@invalid_attrs)
    end

    test "update_org/2 with valid data updates the org" do
      org = org_fixture()
      update_attrs = %{name: "some updated name", slug: "some updated slug"}

      assert {:ok, %Org{} = org} = Organizations.update_org(org, update_attrs)
      assert org.name == "some updated name"
      assert org.slug == "some updated slug"
    end

    test "update_org/2 with invalid data returns error changeset" do
      org = org_fixture()
      assert {:error, %Ecto.Changeset{}} = Organizations.update_org(org, @invalid_attrs)
      assert org == Organizations.get_org!(org.id)
    end

    test "delete_org/1 deletes the org" do
      org = org_fixture()
      assert {:ok, %Org{}} = Organizations.delete_org(org)
      assert_raise Ecto.NoResultsError, fn -> Organizations.get_org!(org.id) end
    end

    test "change_org/1 returns a org changeset" do
      org = org_fixture()
      assert %Ecto.Changeset{} = Organizations.change_org(org)
    end
  end
end
