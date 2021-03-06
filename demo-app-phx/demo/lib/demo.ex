defmodule Demo do
  @moduledoc """
  Demo keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def prefix_name(name) do
    "Sr(a). #{name}"
  end
end
