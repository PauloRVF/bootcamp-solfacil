defmodule Demo.BlogpostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Demo.Blogposts` context.
  """

  @doc """
  Generate a blogpost.
  """
  def blogpost_fixture(attrs \\ %{}) do
    {:ok, blogpost} =
      attrs
      |> Enum.into(%{
        conteudo: "some conteudo",
        titulo: "some titulo"
      })
      |> Demo.Blogposts.create_blogpost()

    blogpost
  end
end
