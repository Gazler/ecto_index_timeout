defmodule FirstAppTest do
  use ExUnit.Case

  test "creating a user" do
    FirstApp.Repo.insert!(%FirstApp.User{name: "foo"})
  end
end
