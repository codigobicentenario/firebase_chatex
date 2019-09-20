defmodule FirebaseChatex.Repo.Migrations.UsersContexts do
  use Ecto.Migration

  def up do
    create table("users") do
      add :name, :string, [null: false]
      add :firebase_id, :string, [null: true]

      timestamps()
    end
  end

  def down do
    drop table("users")
  end
end
