defmodule EcbApp.Repo.Migrations.AddRateDateIndex do
  use Ecto.Migration

  def change do
    create index(:rates, :date)
  end
end
