defmodule GraphqlDojo.Database do
  use Agent

  @initial_database %{
    "person1" => %{
      id: "person1",
      name: "John Doe",
      date_of_birth: DateTime.new!(~D[2000-01-01], ~T[00:00:00.001], "Etc/UTC"),
      address: "Somewhere Street 1",
      friends: ["person2", "person3"]
    },
    "person2" => %{
      id: "person2",
      name: "Jane Doe",
      date_of_birth: DateTime.new!(~D[2001-07-01], ~T[01:59:00.123], "Etc/UTC"),
      address: "Somewhere Street 3",
      friends: ["person1"],
      pets: ["pet1"]
    },
    "person3" => %{
      id: "person3",
      name: "Friendly Friend",
      date_of_birth: DateTime.new!(~D[2020-10-01], ~T[11:59:59.999], "Etc/UTC"),
      address: "Somewhere Street 2"
    },
    "pet1" => %{
      id: "pet1",
      name: "Dog",
      species: "cat",
      owner: "person2"
    }
  }

  def start_link(_ignore) do
    Agent.start_link(fn -> @initial_database end, name: __MODULE__)
  end

  def get(id) do
    Agent.get(__MODULE__, &Map.get(&1, id))
  end

  def get_all do
    Agent.get(__MODULE__, & &1)
  end

  def insert(id, blob) do
    Agent.update(__MODULE__, &Map.put(&1, id, blob))
  end
end
