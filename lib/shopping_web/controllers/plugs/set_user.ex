defmodule Shopping.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Shopping.Repo
  alias Shopping.User

  def init(_params) do # -> here params refers to the returned value from the actual function
  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Repo.get(User, user_id) -> # -> if truthy then part after && is returned and assigned to user
        assign(conn, :user, user) # -> modifies the assigns property set in the auth callback function. Returns the conn
      true ->
        assign(conn, :user, nil)
    end
  end
end
