defmodule Aipim.AccountsTest do
  use Aipim.DataCase

  alias Aipim.Accounts

  describe "orgs" do
    alias Aipim.Accounts.Org

    import Aipim.AccountsFixtures

    @invalid_attrs %{name: nil}

    test "list_orgs/0 returns all orgs" do
      org = org_fixture()
      assert Accounts.list_orgs() == [org]
    end

    test "get_org!/1 returns the org with given id" do
      org = org_fixture()
      assert Accounts.get_org!(org.id) == org
    end

    test "create_org/1 with valid data creates a org" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Org{} = org} = Accounts.create_org(valid_attrs)
      assert org.name == "some name"
    end

    test "create_org/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_org(@invalid_attrs)
    end

    test "update_org/2 with valid data updates the org" do
      org = org_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Org{} = org} = Accounts.update_org(org, update_attrs)
      assert org.name == "some updated name"
    end

    test "update_org/2 with invalid data returns error changeset" do
      org = org_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_org(org, @invalid_attrs)
      assert org == Accounts.get_org!(org.id)
    end

    test "delete_org/1 deletes the org" do
      org = org_fixture()
      assert {:ok, %Org{}} = Accounts.delete_org(org)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_org!(org.id) end
    end

    test "change_org/1 returns a org changeset" do
      org = org_fixture()
      assert %Ecto.Changeset{} = Accounts.change_org(org)
    end
  end

  describe "orgs" do
    alias Aipim.Accounts.Org

    import Aipim.AccountsFixtures

    @invalid_attrs %{name: nil, slug: nil}

    test "list_orgs/0 returns all orgs" do
      org = org_fixture()
      assert Accounts.list_orgs() == [org]
    end

    test "get_org!/1 returns the org with given id" do
      org = org_fixture()
      assert Accounts.get_org!(org.id) == org
    end

    test "create_org/1 with valid data creates a org" do
      valid_attrs = %{name: "some name", slug: "some slug"}

      assert {:ok, %Org{} = org} = Accounts.create_org(valid_attrs)
      assert org.name == "some name"
      assert org.slug == "some slug"
    end

    test "create_org/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_org(@invalid_attrs)
    end

    test "update_org/2 with valid data updates the org" do
      org = org_fixture()
      update_attrs = %{name: "some updated name", slug: "some updated slug"}

      assert {:ok, %Org{} = org} = Accounts.update_org(org, update_attrs)
      assert org.name == "some updated name"
      assert org.slug == "some updated slug"
    end

    test "update_org/2 with invalid data returns error changeset" do
      org = org_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_org(org, @invalid_attrs)
      assert org == Accounts.get_org!(org.id)
    end

    test "delete_org/1 deletes the org" do
      org = org_fixture()
      assert {:ok, %Org{}} = Accounts.delete_org(org)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_org!(org.id) end
    end

    test "change_org/1 returns a org changeset" do
      org = org_fixture()
      assert %Ecto.Changeset{} = Accounts.change_org(org)
    end
  end
end
