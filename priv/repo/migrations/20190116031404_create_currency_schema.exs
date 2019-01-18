defmodule EcbApp.Repo.Migrations.CreateCurrencySchema do
  use Ecto.Migration

  def change do
    create table(:currencies) do
      add :symbol, :string

      timestamps()
    end
  end
end
