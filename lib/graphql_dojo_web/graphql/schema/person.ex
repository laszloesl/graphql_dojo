defmodule GraphqlDojoWeb.GraphQL.Schema.Person do
  use Absinthe.Schema.Notation

  object :person do
    field :id, non_null(:string)
    field :name, non_null(:string)
    field :date_of_birth, non_null(:datetime)
    field :address, :string

    field :friends, list_of(non_null(:person)) do
      resolve(fn %{friends: friends}, _arguments, _resolution_info ->
        friends = Enum.map(friends, &GraphqlDojo.Database.get(&1))
        {:ok, friends}
      end)
    end

    field :pets, list_of(non_null(:string))
  end
end
