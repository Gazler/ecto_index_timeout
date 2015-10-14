defmodule SecondAppTest do
  use ExUnit.Case

  test "creating a user" do
    SecondApp.Repo.insert!(%FirstApp.User{name: "foo"})
  end
end
