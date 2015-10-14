defmodule FirstApp.User do
  use Ecto.Model

  schema "users" do
    field :name, :string
  end
end
