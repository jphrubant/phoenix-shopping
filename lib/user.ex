defmodule Shopping.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    has_many :rows, Shopping

    timestamps()
  end

  def changeset(users, attrs) do
    users
      |> cast(attrs, [:email, :provider, :token])
      |> validate_required([:email, :provider, :token])
  end
end
