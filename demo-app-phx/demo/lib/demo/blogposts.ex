defmodule Demo.Blogposts do
  @moduledoc """
  The Blogposts context.
  """

  import Ecto.Query, warn: false
  alias Demo.Repo

  alias Demo.Blogposts.Blogpost
  alias Demo.Accounts

  @doc """
  Returns the list of blogposts.

  ## Examples

      iex> list_blogposts()
      [%Blogpost{}, ...]

  """
  def list_blogposts_active() do
    query = from b in Blogpost,
      where: b.ativo == true

    Repo.all(query)
  end

  def list_blogposts() do
    Repo.all(Blogpost)
  end

  @doc """
  Gets a single blogpost.

  Raises `Ecto.NoResultsError` if the Blogpost does not exist.

  ## Examples

      iex> get_blogpost!(123)
      %Blogpost{}

      iex> get_blogpost!(456)
      ** (Ecto.NoResultsError)

  """
  def get_blogpost!(id), do: Repo.get!(Blogpost, id)

  @doc """
  Creates a blogpost.

  ## Examples

      iex> create_blogpost(%{field: value})
      {:ok, %Blogpost{}}

      iex> create_blogpost(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_blogpost(attrs) do
    %Blogpost{}
    |> change_blogpost(attrs)
    |> Repo.insert()
  end

  def create_blogpost(user_id, attrs) do
    Accounts.get_user!(user_id)
    |> Ecto.build_assoc(:posts)
    |> change_blogpost(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a blogpost.

  ## Examples

      iex> update_blogpost(blogpost, %{field: new_value})
      {:ok, %Blogpost{}}

      iex> update_blogpost(blogpost, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_blogpost(%Blogpost{} = blogpost, attrs) do
    blogpost
    |> Blogpost.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a blogpost.

  ## Examples

      iex> delete_blogpost(blogpost)
      {:ok, %Blogpost{}}

      iex> delete_blogpost(blogpost)
      {:error, %Ecto.Changeset{}}

  """
  def delete_blogpost(%Blogpost{} = blogpost) do
    Repo.delete(blogpost)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking blogpost changes.

  ## Examples

      iex> change_blogpost(blogpost)
      %Ecto.Changeset{data: %Blogpost{}}

  """
  def change_blogpost(%Blogpost{} = blogpost, attrs \\ %{}) do
    Blogpost.changeset(blogpost, attrs)
  end
end
