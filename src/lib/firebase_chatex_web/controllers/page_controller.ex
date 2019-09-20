defmodule FirebaseChatexWeb.PageController do
  use FirebaseChatexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
