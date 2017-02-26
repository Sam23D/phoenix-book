defmodule Rumblr.UserController do
  
  use Rumblr.Web, :controller

  def index(conn, _params) do
    users = Repo.all( Rumblr.User )
    render conn, "index.html", users: users
  end

end
