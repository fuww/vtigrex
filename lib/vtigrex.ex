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
      iex> )
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

  @doc """
  Lists types.
  """
  @spec list_types(Tesla.Client.t(), nil | [String.t()]) ::
          {:ok, map()} | {:error, String.t()}
  def list_types(client, field_type_list \\ nil) do
    client
    |> Tesla.get("/listtypes",
      query: [
        fieldTypeList: field_type_list || "null"
      ]
    )
    |> parse_result()
  end

  @doc """
  Describes a type.
  """
  @spec describe(Tesla.Client.t(), String.t()) ::
          {:ok, map()} | {:error, String.t()}
  def describe(client, element_type) do
    client
    |> Tesla.get("/describe",
      query: [
        elementType: element_type
      ]
    )
    |> parse_result()
  end

  @doc """
  Runs a query and returns its results.
  """
  @spec query(Tesla.Client.t(), String.t()) :: {:ok, list()} | {:error, String.t()}
  def query(client, query) do
    client
    |> Tesla.get("/query", query: [query: query])
    |> parse_result()
  end

  @doc """
  Retrieves a record.
  """
  @spec retrieve(Tesla.Client.t(), String.t()) :: {:ok, map()} | {:error, String.t()}
  def retrieve(client, id) do
    client
    |> Tesla.get("/retrieve", query: [id: id])
    |> parse_result()
  end

  @doc """
  Creates a new record.
  """
  @spec create(Tesla.Client.t(), String.t(), map()) ::
          {:ok, map()} | {:error, String.t() | Jason.EncodeError.t() | Exception.t()}
  def create(client, element_type, %{} = element) do
    with {:ok, element} <- Jason.encode(element) do
      client
      |> Tesla.get("/create",
        query: [
          elementType: element_type,
          element: element
        ]
      )
      |> parse_result()
    end
  end

  @doc """
  Updates an existing record.

  All the mandatory fields need to be specified.
  """
  @spec update(Tesla.Client.t(), String.t(), map()) ::
          {:ok, map()} | {:error, String.t() | Jason.EncodeError.t() | Exception.t()}
  def update(client, id, %{} = element) do
    with {:ok, element} <- element |> Map.put("id", id) |> Jason.encode() do
      client
      |> Tesla.get("/update",
        query: [
          element: element
        ]
      )
      |> parse_result()
    end
  end

  @doc """
  Updates an existing record.

  It relaxes the constraint that all mandatory fields need to be specified.
  """
  @spec revise(Tesla.Client.t(), String.t(), map()) ::
          {:ok, map()} | {:error, String.t() | Jason.EncodeError.t() | Exception.t()}
  def revise(client, id, %{} = element) do
    with {:ok, element} <- element |> Map.put("id", id) |> Jason.encode() do
      client
      |> Tesla.get("/revise",
        query: [
          element: element
        ]
      )
      |> parse_result()
    end
  end

  defp parse_result(
         {:ok, %Tesla.Env{status: 200, body: %{"success" => true, "result" => result}}}
       ) do
    {:ok, result}
  end

  defp parse_result({:ok, %Tesla.Env{status: 400}}) do
    {:error, "Bad Request"}
  end

  defp parse_result({:ok, %Tesla.Env{status: 401}}) do
    {:error, "Unauthorized"}
  end
end
