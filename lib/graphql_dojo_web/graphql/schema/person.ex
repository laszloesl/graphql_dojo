defmodule GraphqlDojoWeb.GraphQL.Schema.Person do
  use Absinthe.Schema.Notation

  object :person do
    field :id, non_null(:string)
    field :name, non_null(:string)
    field :date_of_birth, non_null(:datetime)
    field :address, :string

    field :friends, list_of(non_null(:person)) do
      resolve(fn %{friends: friends} = _parent, _arguments, _resolution_info ->
        friends = Enum.map(friends, &GraphqlDojo.Database.get(&1))
        {:ok, friends}
      end)
    end

    field :pets, list_of(non_null(:pet)) do
      arg(:species, :string)

      resolve(fn %{pets: pets} = _parent, arguments, _resolution_info ->
        IO.inspect(arguments, label: "args for pets")
        pets = Enum.map(pets, &GraphqlDojo.Database.get(&1))
        {:ok, pets}
      end)
    end
  end

  object(:person_queries) do
    field(:get_person, :person) do
      arg(:id, non_null(:string))

      resolve(fn %{id: id}, _ ->
        person = GraphqlDojo.Database.get(id)
        {:ok, person}
      end)
    end
  end
end
