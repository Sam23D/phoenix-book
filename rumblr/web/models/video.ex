defmodule Rumblr.Video do
  use Rumblr.Web, :model

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    belongs_to :user, Rumblr.User
    belongs_to :category, Rumblr.Caegory

    timestamps()
  end
  
  @required_fields ~w( url title description )
  @optional_fileds ~w( category_id )
  
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :title, :description])
    |> validate_required([:url, :title, :description])
  end
end
