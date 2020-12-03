defmodule GraphqlDojoWeb.GraphQL.Schema.Pet do
  use Absinthe.Schema.Notation

  object :pet do
    field :id, non_null(:string)
    field :species, non_null(:string)
    field :name, non_null(:string)
  end
end
