defmodule GraphqlDojoWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(GraphqlDojoWeb.GraphQL.Schema.Person)

  query do
    field(:get_person, :person, resolve: fn _, _ -> {:error, :no_such_person} end)
  end
end
