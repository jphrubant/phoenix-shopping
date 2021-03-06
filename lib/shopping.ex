defmodule Shopping do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rows" do
    field :item, :string
    field :quantity, :integer
    field :price, :integer
    belongs_to :user, Shopping.User

    timestamps()
  end

  def changeset(rows, attrs) do
    rows
      |> cast(attrs, [:item, :quantity, :price])
      |> validate_required([:item, :quantity, :price])
      # here I can set "unique_contraint" for unique fields
  end
end
