defmodule ShoppingWeb.ShoppingController do
  use ShoppingWeb, :controller

  alias Shopping.Repo

  def index(conn, _params) do
    rows = Repo.all(Shopping)

    render(conn, "index.html", rows: rows)
  end

  def new(conn, _params) do
    changeset = Shopping.changeset(%Shopping{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"shopping" => shopping}) do
    changeset = Shopping.changeset(%Shopping{}, shopping) # <-- naming issue HELP

    case Repo.insert(changeset) do
      {:ok, shopping} ->
        conn
          |> put_flash(:info, "Item was added successfully")
          |> redirect(to: Routes.shopping_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    row = Repo.get(Shopping, id)
    changeset = Shopping.changeset(row, %{})

    render(conn, "edit.html", changeset: changeset, row: row)
  end

  def update(conn, %{"shopping" => shopping, "id" => id}) do
    previous_shopping = Repo.get(Shopping, id)
    changeset = Shopping.changeset(previous_shopping, shopping)

    case Repo.update(changeset) do
      {:ok, _shopping} ->
        conn
          |> put_flash(:info, "Item updated")
          |> redirect(to: Routes.shopping_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset, row: previous_shopping)
    end
  end

  def delete(conn, %{"id" => id}) do
    row = Repo.get!(Shopping, id) |> Repo.delete!

    conn
      |> put_flash(:info, "Item deleted")
      |> redirect(to: Routes.shopping_path(conn, :index))
  end
end
