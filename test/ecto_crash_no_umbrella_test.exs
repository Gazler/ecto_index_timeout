defmodule EctoCrashNoUmbrellaTest do
  use ExUnit.Case

  test "the truth" do
    EctoCrashNoUmbrella.Repo.insert!(%EctoCrashNoUmbrella.User{name: "foo"})
  end

  test "and another" do
    EctoCrashNoUmbrella.RepoTwo.insert!(%EctoCrashNoUmbrella.User{name: "foo"})
  end
end
