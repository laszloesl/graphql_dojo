defmodule GraphqlDojoWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(GraphqlDojoWeb.GraphQL.Schema.Person)

  query do
    field(:get_person, :person) do
      arg(:id, non_null(:string))

      resolve(fn %{id: id}, _ ->
        person = GraphqlDojo.Database.get(id)
        {:ok, person}
      end)
    end
  end
end
