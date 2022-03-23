defmodule DemoWeb.Api.UserView do
  use DemoWeb, :view
  alias DemoWeb.Api.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      nome: user.nome,
      senha: user.senha,
      admin: user.admin
    }
  end
end
