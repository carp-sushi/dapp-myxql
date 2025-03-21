defmodule Dapp.Http.Presenter do
  @moduledoc "Sends use case results as a http json response."
  alias Dapp.Error
  alias Dapp.Http.Response

  @doc """
  Sends a use case result as a http json response.
  """
  def reply({:ok, dto}, conn) do
    case conn.method do
      "POST" -> Response.send_json(conn, dto, 201)
      _ -> Response.send_json(conn, dto)
    end
  end

  def reply({:error, error}, conn), do: Response.send_json(conn, %{error: error}, 400)

  @doc """
  Something went wrong executing a use case.
  """
  def exception(conn) do
    {:error, error} = Error.new("internal error: check server logs for details")
    Response.send_json(conn, %{error: error}, 500)
  end
end
