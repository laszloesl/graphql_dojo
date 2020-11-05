defmodule GraphqlDojoWeb.Router do
  use GraphqlDojoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: GraphqlDojoWeb.GraphQL.Schema

    forward "/", Absinthe.Plug, schema: GraphqlDojoWeb.GraphQL.Schema
  end
end
