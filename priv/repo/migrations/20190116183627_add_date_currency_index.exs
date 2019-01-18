defmodule EcbApp.Repo.Migrations.AddDateCurrencyIndex do
  use Ecto.Migration

  def change do
    alter table(:rates) do
      add :currency_id, references(:currencies)
    end

    create unique_index(:rates, [:date, :currency_id])
  end
end
