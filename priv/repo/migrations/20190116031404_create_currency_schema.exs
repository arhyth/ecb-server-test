defmodule EcbServerTest.Repo.Migrations.CreateCurrencySchema do
  use Ecto.Migration

  def change do
    create table(:currencies) do
      add :symbol, :string

      timestamps()
    end

    unique_index(:currencies, [:symbol])
  end
end
