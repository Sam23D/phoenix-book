defmodule Rumblr.Auth do
  import Plug.Conn
  
  def init(opts) do
    Keyword.fetch!(opts, :repo)
  end
  
  def call(conn, repo) do
    user_id = get_session(conn, :user_id)
    user = user_id && repo.get(Rumblr.User, user_id)
    assing(conn, :current_user, user)
  end

end