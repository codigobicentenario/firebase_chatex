defmodule FirebaseChatexWeb.UserController do
  use FirebaseChatexWeb, :controller

  alias FirebaseChatex.Contexts.UserManager

  def index(conn, _params) do
    render(conn, "index.json", users: UserManager.list())
  end
end
