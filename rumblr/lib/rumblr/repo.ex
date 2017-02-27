defmodule Rumblr.Repo do
  # use Ecto.Repo, otp_app: :rumblr
  
  @moduledoc """
    In memory repo
  """

  def all( Rumblr.User ) do
    [ %Rumblr.User{ id: "1", name: "samuel", username: "sam", password: "1234" },
      %Rumblr.User{ id: "2", name: "alex", username: "tier", password: "1234" },
      %Rumblr.User{ id: "3", name: "carlos", username: "omar", password: "1234" }
    ]
  end

  def all( _module ),  do: []
  
  def get( module, id ) do
    Enum.find all( module ), fn map -> map.id == id end
  end
  

end
