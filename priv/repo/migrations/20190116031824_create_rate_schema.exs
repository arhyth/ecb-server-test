defmodule EcbApp.Repo.Migrations.CreateRateSchema do
  use Ecto.Migration

  def change do
    create table(:rates) do
      add :date, :date
      add :value, :decimal

      timestamps()
    end
  end
end
