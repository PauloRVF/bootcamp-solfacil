defmodule DemoWeb.BlogpostControllerTest do
  use DemoWeb.ConnCase

  import Demo.BlogpostsFixtures

  @create_attrs %{conteudo: "some conteudo", titulo: "some titulo"}
  @update_attrs %{conteudo: "some updated conteudo", titulo: "some updated titulo"}
  @invalid_attrs %{conteudo: nil, titulo: nil}

  describe "index" do
    test "lists all blogposts", %{conn: conn} do
      conn = get(conn, Routes.blogpost_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Blogposts"
    end
  end

  describe "new blogpost" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.blogpost_path(conn, :new))
      assert html_response(conn, 200) =~ "New Blogpost"
    end
  end

  describe "create blogpost" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.blogpost_path(conn, :create), blogpost: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.blogpost_path(conn, :show, id)

      conn = get(conn, Routes.blogpost_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Blogpost"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.blogpost_path(conn, :create), blogpost: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Blogpost"
    end
  end

  describe "edit blogpost" do
    setup [:create_blogpost]

    test "renders form for editing chosen blogpost", %{conn: conn, blogpost: blogpost} do
      conn = get(conn, Routes.blogpost_path(conn, :edit, blogpost))
      assert html_response(conn, 200) =~ "Edit Blogpost"
    end
  end

  describe "update blogpost" do
    setup [:create_blogpost]

    test "redirects when data is valid", %{conn: conn, blogpost: blogpost} do
      conn = put(conn, Routes.blogpost_path(conn, :update, blogpost), blogpost: @update_attrs)
      assert redirected_to(conn) == Routes.blogpost_path(conn, :show, blogpost)

      conn = get(conn, Routes.blogpost_path(conn, :show, blogpost))
      assert html_response(conn, 200) =~ "some updated conteudo"
    end

    test "renders errors when data is invalid", %{conn: conn, blogpost: blogpost} do
      conn = put(conn, Routes.blogpost_path(conn, :update, blogpost), blogpost: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Blogpost"
    end
  end

  describe "delete blogpost" do
    setup [:create_blogpost]

    test "deletes chosen blogpost", %{conn: conn, blogpost: blogpost} do
      conn = delete(conn, Routes.blogpost_path(conn, :delete, blogpost))
      assert redirected_to(conn) == Routes.blogpost_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.blogpost_path(conn, :show, blogpost))
      end
    end
  end

  defp create_blogpost(_) do
    blogpost = blogpost_fixture()
    %{blogpost: blogpost}
  end
end
