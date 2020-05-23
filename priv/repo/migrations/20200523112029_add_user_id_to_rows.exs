defmodule Shopping.Repo.Migrations.AddUserIdToRows do
  use Ecto.Migration

  def change do
    alter table(:rows) do
      add :user_id, references (:users)
    end
  end
end
