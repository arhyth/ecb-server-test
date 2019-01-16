defmodule EcbServerTest.Repo.Migrations.CreateRateSchema do
  use Ecto.Migration

  def change do
    create table(:rates) do
      add :date, :date
      add :value, :decimal

      add :currency, references(:currencies)

      timestamps()
    end

    unique_index(:rates, [:date, :currency])
  end
end
