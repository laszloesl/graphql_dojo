defmodule GraphqlDojoWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(GraphqlDojoWeb.GraphQL.Schema.Person)
  import_types(GraphqlDojoWeb.GraphQL.Schema.Pet)

  query do
    import_fields(:person_queries)
    import_fields(:pet_queries)
  end

  mutation do
    import_fields(:pet_mutations)
  end
end
