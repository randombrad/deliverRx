defmodule DeliverRx.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :name, :string
      add :address, :string
      add :city, :string
      add :state, :string
      add :zip, :string

      timestamps()
    end

  end
end
