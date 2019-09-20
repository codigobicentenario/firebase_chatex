defmodule FirebaseChatex.Repo do
  use Ecto.Repo,
    otp_app: :firebase_chatex,
    adapter: Ecto.Adapters.Postgres
end
