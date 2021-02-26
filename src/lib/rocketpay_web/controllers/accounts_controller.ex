defmodule RocketpayWeb.AccountsController do
  use RocketpayWeb, :controller

  alias Rocketpay.Account

  action_fallback RocketpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Rocketpay.deposit(params) do
      conn
      |> put_status(:created)
      |> render("update.json", account: account)
    end
  end

  # def withdraw(conn, params) do
  #   with {:ok, %Account{} = account} <- Rocketpay.withdraw(params) do
  #     conn
  #     |> put_status(:created)
  #     |> render("update.json", account: user)
  #   end
  # end

  defp handle_response({:error, _result} = error , _conn), do: error
end
