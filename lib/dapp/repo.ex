defmodule Dapp.Repo do
  @moduledoc """
  MySQL database repository.
  """
  use Ecto.Repo,
    otp_app: :dapp,
    adapter: Ecto.Adapters.MyXQL
end
