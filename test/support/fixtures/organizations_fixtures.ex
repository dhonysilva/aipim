defmodule Aipim.OrganizationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Aipim.Organizations` context.
  """

  @doc """
  Generate a org.
  """
  def org_fixture(attrs \\ %{}) do
    {:ok, org} =
      attrs
      |> Enum.into(%{
        name: "some name",
        slug: "some slug"
      })
      |> Aipim.Organizations.create_org()

    org
  end
end
