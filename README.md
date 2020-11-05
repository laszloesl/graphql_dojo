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

- Mutations: the silent M at the end in order to manipulate data.

## How this project was created

In order to use GraphQL with Absinthe you need a relatively small application that has at least Plug as a dependency.
But Absinthe's docs assume in most places that you have a Phoenix application, so we'll create the simplest one we can:

```
mix phx.new graphql_dojo --no-html --no-webpack --no-ecto --no-webpack --no-dashboard
```
