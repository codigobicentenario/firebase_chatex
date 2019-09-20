defmodule FirebaseChatex.Contexts.UserManager do
  @moduledoc """
  Manejador de usuarios.
  """

  import Ecto.{Query, Changeset}, warn: false

  alias FirebaseChatex.Repo
  alias FirebaseChatex.Contexts.User

  @fields [:name, :firebase_id]
  @required [:name, :firebase_id]

  @doc """
  Lista todos los usuarios.
  """
  def list, do: Repo.all(User)

  @doc """
  Crea un usuario.
  """
  @spec create(map) :: struct
  def create(attrs \\ %{}) do
    with {:ok, user} <- Repo.insert(changeset(%User{}, attrs)) do
      {:ok, get(user.id)}
    end
  end

  @doc """
  Busca un usuario por ID.
  """
  @spec get(integer) :: struct
  def get(id) do
    User
    |> preload(:messages)
    |> Repo.get(id)
  end

  @doc """
  Actualiza un usuario.
  """
  @spec update(struct, map) :: struct
  def update(%User{} = struct, attrs) do
    struct
    |> changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Elimina una usuario.
  """
  @spec delete(map) :: tuple
  def delete(%User{} = struct) do
    Repo.delete(struct)
  end

  @doc """
  Devuelve un changeset para el schema de funny answers.
  """
  @spec get_changeset(struct, struct) :: struct
  def get_changeset(struct \\ %User{}, params \\ %{}) do
    changeset(struct, params)
  end

  defp changeset(%User{} = struct, attrs \\ %{}) do
    struct
    |> cast(attrs, @fields)
    |> validate_required(@required)
  end
end