defmodule Vtigrex do
  @moduledoc """
  vtiger Rest API wrapper
  """

  @doc """
  Initializes the client for your vtiger API.

  ## Examples

      iex> Vtigrex.client(
      iex>   "https://your_instance.odx.vtiger.com/restapi/v1/vtiger/default",
      iex>   "your_user@your_host.com",
      iex>   "y0ur4cc3sk3y"
      iex>)
      %Tesla.Client{
        pre: [
          {Tesla.Middleware.BaseUrl, :call, ["https://your_instance.odx.vtiger.com/restapi/v1/vtiger/default"]},
          {Tesla.Middleware.BasicAuth, :call, [[username: "your_user@your_host.com", password: "y0ur4cc3sk3y"]]},
          {Tesla.Middleware.JSON, :call, [[{:decode_content_types, ["text/json"]}]]}
        ]
      }

  """
  @spec client(String.t(), String.t(), String.t()) ::
          Tesla.Client.t()
  def client(base_url, username, access_key) do
    middlewares = [
      {Tesla.Middleware.BaseUrl, base_url},
      {Tesla.Middleware.BasicAuth, username: username, password: access_key},
      {Tesla.Middleware.JSON, decode_content_types: ["text/json"]}
    ]

    Tesla.client(middlewares)
  end

  @doc """
  Gets the current user.
  """
  @spec me(Tesla.Client.t()) :: {:ok, map()} | {:error, String.t()}
  def me(client) do
    client
    |> Tesla.get("/me")
    |> parse_result()
  end

  defp parse_result(
         {:ok, %Tesla.Env{status: 200, body: %{"success" => true, "result" => %{} = result}}}
       ) do
    {:ok, result}
  end

  defp parse_result({:ok, %Tesla.Env{status: 401}}) do
    {:error, "Unauthorized"}
  end
end
