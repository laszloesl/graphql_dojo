# GraphqlDojo

## What is GraphQL?

"GraphQL is a **query language** that gives the users of an API the ability to
describe the data that they want, and lets creators of the API focus on data
relationships and business rules instead of worrying about the various data
payloads the API needs to return."
(Bruce Williams, Ben Wilson - Craft GraphQL APIs in Elixir with Absinthe).

Let's check GitHub's GraphQL API: https://graphql.github.com/

- Graph: because you represent data as objects and the relationship between those objects.
  (Especially in Relay in which objects are *nodes* and relations are *edges*.)

- QL: because it is a query language.

- Mutations: the invisible M at the end in order to manipulate data.

By convention **Queries** are used to fetch data and **mutations** are for manipulating data.
This is not enforced, depending on the implementation queries can have side-effects, but they should be avoided.

There are also **subscriptions** to receive data in a push-based manner.

You send a GraphQL **document** as a request and receive a JSON as the response.

The **schema** defines all **types** (structure of data), queries, mutations and subscriptions.

## Absinthe

### How this project was created

In order to use GraphQL with **Absinthe** you need a relatively small application that has at least **Plug** as a dependency.
But Absinthe's docs assume in most places that you have a **Phoenix** application, so we'll create the simplest one we can:

```
mix phx.new graphql_dojo --no-html --no-webpack --no-ecto --no-webpack --no-dashboard
```

Add Absinthe dependencies:

```
{:absinthe, "~> 1.5"},
{:absinthe_phoenix, "~> 2.0"},
```

Then create the schema:

```
defmodule GraphqlDojoWeb.GraphQL.Schema do
  use Absinthe.Schema

  query do
  end
end
```

And add it to the router:

```
defmodule GraphqlDojoWeb.Router do
  use GraphqlDojoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GraphqlDojoWeb do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: GraphqlDojoWeb.GraphQL.Schema

    forward "/", Absinthe.Plug, schema: GraphqlDojoWeb.GraphQL.Schema
  end
end
```
