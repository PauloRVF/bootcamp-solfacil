defmodule DemoWeb.BlogpostController do
  use DemoWeb, :controller

  alias Demo.Blogposts
  alias Demo.Blogposts.Blogpost

  def index(conn, _params) do
    blogposts = Blogposts.list_blogposts()
    render(conn, "index.html", blogposts: blogposts)
  end

  def new(conn, _params) do
    changeset = Blogposts.change_blogpost(%Blogpost{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"blogpost" => blogpost_params}) do
    case Blogposts.create_blogpost(blogpost_params) do
      {:ok, blogpost} ->
        conn
        |> put_flash(:info, "Blogpost created successfully.")
        |> redirect(to: Routes.blogpost_path(conn, :show, blogpost))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    blogpost = Blogposts.get_blogpost!(id)
    render(conn, "show.html", blogpost: blogpost)
  end

  def edit(conn, %{"id" => id}) do
    blogpost = Blogposts.get_blogpost!(id)
    changeset = Blogposts.change_blogpost(blogpost)
    render(conn, "edit.html", blogpost: blogpost, changeset: changeset)
  end

  def update(conn, %{"id" => id, "blogpost" => blogpost_params}) do
    blogpost = Blogposts.get_blogpost!(id)

    case Blogposts.update_blogpost(blogpost, blogpost_params) do
      {:ok, blogpost} ->
        conn
        |> put_flash(:info, "Blogpost updated successfully.")
        |> redirect(to: Routes.blogpost_path(conn, :show, blogpost))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", blogpost: blogpost, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    blogpost = Blogposts.get_blogpost!(id)
    {:ok, _blogpost} = Blogposts.delete_blogpost(blogpost)

    conn
    |> put_flash(:info, "Blogpost deleted successfully.")
    |> redirect(to: Routes.blogpost_path(conn, :index))
  end
end
