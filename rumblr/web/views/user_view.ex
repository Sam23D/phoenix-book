defmodule Rumblr.UserView do
  use Rumblr.Web, :view
  alias Rumblr.User
  
  def first_name( %User{ name: name } ) do
    name
    |> String.split( " " )
    |> Enum.at(0)
    |> String.capitalize
  end 


end
