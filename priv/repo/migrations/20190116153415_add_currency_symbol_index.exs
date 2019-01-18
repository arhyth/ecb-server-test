defmodule EcbApp.Repo.Migrations.AddCurrencySymbolIndex do
  use Ecto.Migration

  def change do
    create unique_index(:currencies, [:symbol])
  end
end
