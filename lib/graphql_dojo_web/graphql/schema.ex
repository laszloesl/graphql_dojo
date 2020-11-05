defmodule GraphqlDojoWeb.GraphQL.Schema do
  use Absinthe.Schema

  query do
    field(:hello, :string, resolve: fn _, _ -> {:ok, "hello"} end)
  end
end
