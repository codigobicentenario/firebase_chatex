defmodule FirebaseChatex.Contexts.User do
  @moduledoc """
  Esquema de usuarios.
  """
  use Ecto.Schema

  schema "users" do
    field :name, :string, [null: false]
    field :firebase_id, :string, [null: false]

    timestamps()
  end
end