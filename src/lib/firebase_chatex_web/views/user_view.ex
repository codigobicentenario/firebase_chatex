defmodule FirebaseChatexWeb.UserView do
  use FirebaseChatexWeb, :view

  alias FirebaseChatexWeb.UserView

  def render("index.json", %{users: users}) do
    %{
      status: "success",
      data: render_many(users, UserView, "user.json", as: :user),
      errors: nil
    }
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name
    }
  end
end
