defmodule Aipim.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Aipim.Accounts` context.
  """

  @doc """
  Generate a org.
  """
  def org_fixture(attrs \\ %{}) do
    {:ok, org} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Aipim.Accounts.create_org()

    org
  end
end
