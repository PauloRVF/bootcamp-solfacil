defmodule Demo.BlogpostsTest do
  use Demo.DataCase

  alias Demo.Blogposts

  describe "blogposts" do
    alias Demo.Blogposts.Blogpost

    import Demo.BlogpostsFixtures

    @invalid_attrs %{conteudo: nil, titulo: nil}

    test "list_blogposts/0 returns all blogposts" do
      blogpost = blogpost_fixture()
      assert Blogposts.list_blogposts() == [blogpost]
    end

    test "get_blogpost!/1 returns the blogpost with given id" do
      blogpost = blogpost_fixture()
      assert Blogposts.get_blogpost!(blogpost.id) == blogpost
    end

    test "create_blogpost/1 with valid data creates a blogpost" do
      valid_attrs = %{conteudo: "some conteudo", titulo: "some titulo"}

      assert {:ok, %Blogpost{} = blogpost} = Blogposts.create_blogpost(valid_attrs)
      assert blogpost.conteudo == "some conteudo"
      assert blogpost.titulo == "some titulo"
    end

    test "create_blogpost/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blogposts.create_blogpost(@invalid_attrs)
    end

    test "update_blogpost/2 with valid data updates the blogpost" do
      blogpost = blogpost_fixture()
      update_attrs = %{conteudo: "some updated conteudo", titulo: "some updated titulo"}

      assert {:ok, %Blogpost{} = blogpost} = Blogposts.update_blogpost(blogpost, update_attrs)
      assert blogpost.conteudo == "some updated conteudo"
      assert blogpost.titulo == "some updated titulo"
    end

    test "update_blogpost/2 with invalid data returns error changeset" do
      blogpost = blogpost_fixture()
      assert {:error, %Ecto.Changeset{}} = Blogposts.update_blogpost(blogpost, @invalid_attrs)
      assert blogpost == Blogposts.get_blogpost!(blogpost.id)
    end

    test "delete_blogpost/1 deletes the blogpost" do
      blogpost = blogpost_fixture()
      assert {:ok, %Blogpost{}} = Blogposts.delete_blogpost(blogpost)
      assert_raise Ecto.NoResultsError, fn -> Blogposts.get_blogpost!(blogpost.id) end
    end

    test "change_blogpost/1 returns a blogpost changeset" do
      blogpost = blogpost_fixture()
      assert %Ecto.Changeset{} = Blogposts.change_blogpost(blogpost)
    end
  end
end
