defmodule DeliverRx.Repo.Migrations.CreateCouriers do
  use Ecto.Migration

  def change do
    create table(:couriers) do
      add :name, :string
      add :address, :string
      add :city, :string
      add :zip, :string
      add :serviced_ids, :integer

      timestamps()
    end

  end
end
