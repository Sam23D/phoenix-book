defmodule Rumblr.User do
  use Rumblr.Web, :model

  schema "users" do
    
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps

  end
  def changeset( model, params \\ :empty ) do
    model
    |> cast(params,  ~w( name username ), [] )
    |> validate_length(:username, min: 1, max: 20)
  end

  def registration_changeset( model, params ) do
    model
    |> changeset( params)
    |> cast( params, ~w(password), [] )
    |> validate_length(:password, min: 6, max: 100 )
    |> put_pass_hash()
  end
  
  defp put_pass_hash(changeset  )do
    case changeset do
      %Ecto.Changeset{ valid?: true, changes: %{ password: pass }} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
    
    defp authenticate(conn) do
      if conn.assings.curren_user do
        conn
      else
        conn
        |> put_flash(:error, "You must be logged in to acces that paeg")
        |> redirect(to: page_path(conn, :index))
        |> halt()
      end
    end
  end

end
