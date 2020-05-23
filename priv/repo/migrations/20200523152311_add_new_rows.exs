defmodule Shopping.Repo.Migrations.AddNewRows do
  use Ecto.Migration

  def change do
    create table(:rows) do
      add :item, :string
      add :quantity, :integer
      add :price, :integer
      add :user_id, references (:users)

      timestamps()
    end
  end
end
