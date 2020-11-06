defmodule GraphqlDojoWeb.GraphQL.Schema.Person do
  use Absinthe.Schema.Notation

  object :person do
    field :id, non_null(:string)
    field :name, non_null(:string)
    field :date_of_birth, non_null(:datetime)
    field :address, :string
    field :friends, list_of(:string)
    field(:pets, list_of(:string))
  end
end
