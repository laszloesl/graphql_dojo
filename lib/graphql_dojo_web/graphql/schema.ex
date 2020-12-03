defmodule GraphqlDojoWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(GraphqlDojoWeb.GraphQL.Schema.Person)
  import_types(GraphqlDojoWeb.GraphQL.Schema.Pet)

  query do
    field(:get_person, :person) do
      arg(:id, non_null(:string))

      resolve(fn %{id: id}, _ ->
        person = GraphqlDojo.Database.get(id)
        {:ok, person}
      end)
    end

    field(:get_pet, :pet) do
      arg(:id, non_null(:string))

      resolve(fn %{id: id}, _ ->
        pet = GraphqlDojo.Database.get(id)
        {:ok, pet}
      end)
    end
  end

  mutation do
    field(:create_pet, non_null(:pet)) do
      arg(:id, non_null(:string))
      arg(:species, non_null(:string))
      arg(:name, non_null(:string))

      resolve(fn %{id: id, species: _species, name: _name} = pet, _resolution_info ->
        :ok = GraphqlDojo.Database.insert(id, pet)
        {:ok, pet}
      end)
    end
  end
end
