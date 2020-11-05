defmodule GraphqlDojoWeb.Router do
  use GraphqlDojoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GraphqlDojoWeb do
    pipe_through :api
  end
end
