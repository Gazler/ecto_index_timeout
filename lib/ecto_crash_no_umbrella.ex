defmodule EctoCrashNoUmbrella do
  use Application
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(EctoCrashNoUmbrella.Repo, []),
      worker(EctoCrashNoUmbrella.RepoTwo, [])
    ]

    opts = [strategy: :one_for_one, name: FirstApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
