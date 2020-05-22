defmodule Shopping.Repo.Migrations.CreateCartRowsTable do
  use Ecto.Migration

  def change do
    create table("rows") do
      add :item, :string
      add :quantity, :integer
      add :price, :integer

      timestamps()
    end
  end
end
