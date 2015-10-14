defmodule SecondApp do
  use Application
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(SecondApp.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: SecondApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
