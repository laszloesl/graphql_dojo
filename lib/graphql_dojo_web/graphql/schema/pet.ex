defmodule GraphqlDojoWeb.GraphQL.Schema.Pet do
  use Absinthe.Schema.Notation

  object :pet do
    field :id, non_null(:string)
    field :species, non_null(:string)
    field :name, non_null(:string)
  end

  object(:pet_queries) do
    field(:get_pet, :pet) do
      arg(:id, non_null(:string))

      resolve(fn %{id: id}, _ ->
        pet = GraphqlDojo.Database.get(id)
        {:ok, pet}
      end)
    end
  end

  object(:pet_mutations) do
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
